package com.kcc.springmini.domain.member.repository;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.repository.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MemberRepositoryImpl implements MemberRepository {

    private final MemberMapper memberMapper;

    @Override
    public MemberVO findById(String username) {
        return memberMapper.findById(username);
    }

    @Override
    public void save(MemberVO member) {
        memberMapper.save(member);
    }
}
