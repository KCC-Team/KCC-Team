package com.kcc.springmini.domain.member.service;

import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.member.model.dto.MemberApproveRequestDto;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.repository.MemberRepository;
import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public MemberVO findById(String username) {
        return memberRepository.findById(username);
    }

    @Override
    public void save(MemberVO member) {
        String rawPassword = member.getPassword();
        String encryptedPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setPassword(encryptedPassword);
        memberRepository.save(member);
    }

    @Override
    public int update(MemberVO member) {
        String rawPassword = member.getPassword();
        String encryptedPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setPassword(encryptedPassword);
        return memberRepository.update(member);
    }

    @Override
    public int delete(String username) {
        return memberRepository.delete(username);
    }

    @Override
    public List<MeetUpVO> getMeetupList(String username) {
        return memberRepository.getMeetupList(username);
    }

    @Override
    public List<ScheduleVO> getScheduleList(String username) {
        return memberRepository.getScheduleList(username);
    }

	@Override
	public void deletePendingMember(MemberApproveRequestDto dto) {
		memberRepository.deletePendingMember(dto);
	}

}
