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
    private String deadline;            // 마감 기한
    private String leader;              // 모임장
    private int accept_count;           // 참여 인원

    @Builder
    private ScheduleResponseDto(String title, String content, int person, String deadline, String appointment_time, String leader, int accept_count) {
        this.title = title;
        this.content = content;
        this.person = person;
        this.deadline = deadline;
        this.appointment_time = appointment_time;
        this.leader = leader;
        this.accept_count = accept_count;
    }
}