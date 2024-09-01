package com.kcc.springmini.domain.member.repository.mapper;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    MemberVO findById(String username);
    void save(MemberVO member);
    int update(MemberVO member);
    int delete(String username);
}