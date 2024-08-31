package com.kcc.springmini.domain.member.service;

import com.kcc.springmini.domain.member.model.vo.MemberVO;

public interface MemberService {
    MemberVO findById(String username);
    void save(MemberVO member);
}
