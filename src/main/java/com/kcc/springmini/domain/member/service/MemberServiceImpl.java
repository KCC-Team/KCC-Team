package com.kcc.springmini.domain.member.service;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;

    @Override
    public MemberVO findById(String username) {
        return memberRepository.findById(username);
    }

    @Override
    public void save(MemberVO member) {
        memberRepository.save(member);
    }
}
