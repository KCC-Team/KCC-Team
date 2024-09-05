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

import java.util.ArrayList;
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

        for (int i = 0; i < 100; i++) {
            MemberVO member = MemberVO.builder()
                    .username("admin" + i)
                    .password("admin" + i)
                    .nickname("admin" + i)
                    .email("admin" + i + "@example.com")
                    .gender("M")
                    .birthdate(Date.from(new Date().toInstant()))
                    .tel("010-1234-5678")
                    .address("서울시 강남구")
                    .isdelete("F")
                    .build();
            memberService.save(member, null);
        }

        SecurityContextHolder.getContext().setAuthentication(
                new UsernamePasswordAuthenticationToken(
                        principalDetailService.loadUserByUsername("admin1"),
                        null,
                        principalDetailService.loadUserByUsername("admin1").getAuthorities()
                )
        );
//        meetUpService.insertMeetup(MeetUpRequestDto.builder()
//                .title("test")
//                .intro("test")
//                .content("test")
//                .person(4)
//                .category("test")
//                .build());
//        meetUpService.insertMeetup(MeetUpRequestDto.builder()
//                .title("test2")
//                .intro("test2")
//                .content("test2")
//                .person(4)
//                .category("test2")
//                .build());
    }
}
