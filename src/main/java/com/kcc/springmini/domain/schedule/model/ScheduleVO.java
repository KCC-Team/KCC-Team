package com.kcc.springmini.domain.schedule.model;

import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleVO implements Serializable {
    private Long meetUpId;
    private Long memberId;

    @Size(min = 5, max = 25, message = "5자 이상 25 이하로 입력해주세요.")
    private String scheduleTitle;

    @Min(value = 50, message = "50자 이상 입력해주세요.")
    private String scheduleDescription;
    private String location;
    private int participantLimit;

    private String deadline;

    @FutureOrPresent(message = "약속 시간은 현재 시간 이후여야 합니다.")
    private String scheduleTime;

    public ScheduleVO(Long meetUpId, Long memberId, String scheduleTitle, String scheduleDescription, String location, int participantLimit, String deadline, String scheduleTime) {
        this.meetUpId = meetUpId;
        this.memberId = memberId;
        this.scheduleTitle = scheduleTitle;
        this.scheduleDescription = scheduleDescription;
        this.location = location;
        this.participantLimit = participantLimit;
        this.deadline = deadline;
        this.scheduleTime = scheduleTime;
    }
}
