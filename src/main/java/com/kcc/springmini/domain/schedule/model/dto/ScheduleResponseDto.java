package com.kcc.springmini.domain.schedule.model.dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleResponseDto {
    private String title;               // 제목
    private String content;             // 내용
    private int person;                 // 제한 인원
    private String deadline;            // 마감 기한
    private String appointment_time;    // 약속 시간
}