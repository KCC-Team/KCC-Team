package com.kcc.springmini.domain.schedule.model.dto;

import lombok.*;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleListResponseDto {
    private String title;               // 제목
    private String content;             // 내용
    private int person;                 // 제한 인원
    private String deadline;            // 마감 기한
    private String appointment_time;    // 약속 시간
    private String schedule_id;         // 스케줄 아이디

    @Builder
    private ScheduleListResponseDto(String title, String content, int person, String deadline, String appointment_time, String schedule_id) {
        this.title = title;
        this.content = content;
        this.person = person;
        this.deadline = deadline;
        this.appointment_time = appointment_time;
        this.schedule_id = schedule_id;
    }
}