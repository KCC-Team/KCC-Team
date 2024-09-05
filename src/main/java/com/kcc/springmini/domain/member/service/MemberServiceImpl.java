package com.kcc.springmini.domain.member.service;

import com.kcc.springmini.domain.common.mapper.FileMapper;
import com.kcc.springmini.domain.common.model.FileStatus;
import com.kcc.springmini.domain.common.utils.AwsS3Utils;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.member.mapper.MemberMapper;
import com.kcc.springmini.domain.member.model.dto.MemberApproveRequestDto;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.global.exception.BadRequestException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberMapper memberMapper;
    private final FileMapper fileMapper;
    private final AwsS3Utils awsS3Utils;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public MemberVO findById(String username) {
        return memberMapper.findById(username);
    }

    @Override
    public void save(MemberVO member, MultipartFile file) {
        String rawPassword = member.getPassword();
        String encryptedPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setPassword(encryptedPassword);
        memberMapper.save(member);

        if (file != null) {
            Map<String, Object> map = new HashMap<>();
            map.put("fileOriginalName", file.getOriginalFilename());
            map.put("memberId", member.getMemberId());
            String fileName = UUID.randomUUID().toString();
            map.put("fileName", fileName);
            map.put("type", FileStatus.MEMBER.getValue());

            if (fileMapper.saveMemberFile(map) == 1) {
                try {
                    awsS3Utils.saveFile(file, fileName);
                } catch (IOException e) {
                    throw new BadRequestException("파일 저장에 실패했습니다.", HttpStatus.BAD_REQUEST);
                }
            } else {
                throw new BadRequestException("파일 저장에 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
        }
    }

    @Override
    public int update(MemberVO member) {
        String rawPassword = member.getPassword();
        String encryptedPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setPassword(encryptedPassword);
        return memberMapper.update(member);
    }

    @Override
    public int delete(String username) {
        return memberMapper.delete(username);
    }

    @Override
    public List<MeetUpVO> getMeetupList(String username) {
        return memberMapper.getMeetupList(username);
    }

    @Override
    public List<ScheduleVO> getScheduleList(String username) {
        return memberMapper.getScheduleList(username);
    }

	@Override
	public void deletePendingMember(MemberApproveRequestDto dto) {
        memberMapper.deletePendingMember(dto);
	}

}
