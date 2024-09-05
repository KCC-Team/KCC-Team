package com.kcc.springmini.domain.schedule.model.dto;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleResponseDto {
    private String title;               // 제목
    private String content;             // 내용
    private String appointment_time;    // 약속 시간
    private int person;                 // 제한 인원
    private String location;            // 장소
    private String deadline;            // 마감 기한
    private String leader;              // 모임장
    private Long scheduleId;           // 일정 아이디
    private Long memberId;           // 회원 아이디
    private int accept_count;           // 참여 인원

    @Builder
    private ScheduleResponseDto(String title, String content, String appointment_time,
                               int person, String location, String deadline, String leader, Long scheduleId, Long memberId, int accept_count) {
        this.title = title;
        this.content = content;
        this.appointment_time = appointment_time;
        this.person = person;
        this.location = location;
        this.deadline = deadline;
        this.leader = leader;
        this.scheduleId = scheduleId;
        this.memberId = memberId;
        this.accept_count = accept_count;
    }
}