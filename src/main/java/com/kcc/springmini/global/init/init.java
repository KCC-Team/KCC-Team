package com.kcc.springmini.global.init;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Configuration
@Transactional
@Profile({"dev"})
@RequiredArgsConstructor
public class init implements ApplicationRunner {
    private final MemberService memberService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        MemberVO member = MemberVO.builder()
                .username("admin")
                .password("admin")
                .nickname("admin")
                .email("admin@example.com")
                .gender("M")
                .birthdate(Date.from(new Date().toInstant()))
                .tel("010-1234-5678")
                .address("서울시 강남구")
                .isdelete("F")
                .build();

        memberService.save(member);

        MemberVO member2 = MemberVO.builder()
                .username("admin2")
                .password("admin2")
                .nickname("admin")
                .email("admin@example.com")
                .gender("M")
                .birthdate(Date.from(new Date().toInstant()))
                .tel("010-1234-5678")
                .address("서울시 강남구")
                .isdelete("F")
                .build();

        memberService.save(member2);

        MemberVO member3 = MemberVO.builder()
                .username("admin3")
                .password("admin3")
                .nickname("admin")
                .email("admin@example.com")
                .gender("M")
                .birthdate(Date.from(new Date().toInstant()))
                .tel("010-1234-5678")
                .address("서울시 강남구")
                .isdelete("F")
                .build();

        memberService.save(member3);

        MemberVO member4 = MemberVO.builder()
                .username("admin4")
                .password("admin4")
                .nickname("admin")
                .email("admin@example.com")
                .gender("M")
                .birthdate(Date.from(new Date().toInstant()))
                .tel("010-1234-5678")
                .address("서울시 강남구")
                .isdelete("F")
                .build();

        memberService.save(member4);

        MemberVO member5 = MemberVO.builder()
                .username("admin5")
                .password("admin5")
                .nickname("admin")
                .email("admin@example.com")
                .gender("M")
                .birthdate(Date.from(new Date().toInstant()))
                .tel("010-1234-5678")
                .address("서울시 강남구")
                .isdelete("F")
                .build();

        memberService.save(member5);
    }
}
