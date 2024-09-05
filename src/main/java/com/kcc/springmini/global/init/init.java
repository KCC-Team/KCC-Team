package com.kcc.springmini.global.init;

import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.service.MeetUpService;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.service.MemberService;
import com.kcc.springmini.global.auth.PrincipalDetailService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Configuration
@Transactional
@Profile({"dev"})
@RequiredArgsConstructor
public class init implements ApplicationRunner {
    private final MemberService memberService;
    private final MeetUpService meetUpService;
    private final PrincipalDetailService principalDetailService;

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
                .nickname("admin2")
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
                .nickname("admin3")
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
                .nickname("admin4")
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
                .nickname("admin5")
                .email("admin@example.com")
                .gender("M")
                .birthdate(Date.from(new Date().toInstant()))
                .tel("010-1234-5678")
                .address("서울시 강남구")
                .isdelete("F")
                .build();

        memberService.save(member5);

        SecurityContextHolder.getContext().setAuthentication(
                new UsernamePasswordAuthenticationToken(
                        principalDetailService.loadUserByUsername("admin"),
                        null,
                        principalDetailService.loadUserByUsername("admin").getAuthorities()
                )
        );
        meetUpService.insertMeetup(MeetUpRequestDto.builder()
                .title("test")
                .intro("test")
                .contentList(List.of("말티즈좋아함?","test2","test3"))
                .person(4)
                .category("test")
                .build());
        meetUpService.insertMeetup(MeetUpRequestDto.builder()
                .title("test2")
                .intro("test2")
                .contentList(List.of("고양이좋아함?","test2","test3"))
                .person(4)
                .category("test2")
                .build());
    }
}
