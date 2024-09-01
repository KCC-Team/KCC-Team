package com.kcc.springmini.domain.member.repository;

import com.kcc.springmini.domain.member.model.vo.MemberVO;

public interface MemberRepository {
    MemberVO findById(String username);
    void save(MemberVO member);
    int update(MemberVO member);
    int delete(String username);
}
