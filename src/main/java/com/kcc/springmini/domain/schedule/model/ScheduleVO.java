package com.kcc.springmini.domain.schedule.model;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class ScheduleVO implements Serializable {
    private Long meetUpId;
    private Long memberId;
    private String scheduleTitle;
    private String scheduleDescription;
    private String location;
    private int participantLimit;
    private String deadline;
    private String scheduleTime;
}
