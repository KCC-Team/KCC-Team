package com.kcc.springmini.domain.member.service;

import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.member.mapper.MemberMapper;
import com.kcc.springmini.domain.member.model.dto.MemberApproveRequestDto;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberMapper memberMapper;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public MemberVO findById(String username) {
        return memberMapper.findById(username);
    }

    @Override
    public void save(MemberVO member) {
        String rawPassword = member.getPassword();
        String encryptedPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setPassword(encryptedPassword);
        memberMapper.save(member);
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
