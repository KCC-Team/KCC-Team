package com.kcc.springmini.domain.schedule.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleVO {
    private Long schedule_id;
    private Long meet_up_id;
    private Long member_id;
    private String title;
    private String content;
    private String location;
    private int person;
    private String deadline;
    private String appointment_time;
}
