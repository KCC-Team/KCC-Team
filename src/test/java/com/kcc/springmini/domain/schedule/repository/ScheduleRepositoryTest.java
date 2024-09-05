package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.repository.MeetUpRepository;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.repository.MemberRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;

import java.util.Date;
import java.util.List;

@MybatisTest(properties = "spring.profiles.active=test")
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class ScheduleRepositoryTest {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private MeetUpRepository meetUpRepository;

    @Autowired
    private MemberRepository memberRepository;

    @BeforeEach
    void setUp() {
        memberRepository.save(MemberVO.builder()
                .username("test")
                .password("test")
                .nickname("test")
                .email("test@example.com")
                .gender("M")
                .birthdate(new Date("2024-09-04"))
                .tel("010-1234-5678")
                .address("서울시 강남구")
                .build());

        meetUpRepository.insertMeetup(MeetUpRequestDto.builder()
                .title("test")
                .intro("test")
                .contentList(List.of("말티즈좋아함?","test2","test3"))
                .person(4)
                .category("test")
                .build());
    }

    @DisplayName("모임 일정 생성")
    @Test
    void saveMeetUpSchedule() throws Exception {
        //given
//        new Sche

        //when


        //then

    }

}