package com.kcc.springmini.domain.schedule.model;

import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleVO implements Serializable {
    private Long meetUpId;
    private Long memberId;

    @NotNull
    @Size(min = 5, max = 25, message = "5자 이상 25 이하로 입력해주세요.")
    private String scheduleTitle;

    @NotNull
    @Length(max=250, message = "250자 이상 입력할 수 없습니다.")
    private String scheduleDescription;

    private String location;

    @NotNull
    private Integer participantLimit;

    private String deadline;

//    @FutureOrPresent(message = "약속 시간은 현재 시간 이후여야 합니다.")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String scheduleDateTime;

    public ScheduleVO(Long meetUpId, Long memberId, String scheduleTitle, String scheduleDescription, String location, Integer participantLimit,
                      String deadline, String scheduleDateTime) {
        this.meetUpId = meetUpId;
        this.memberId = memberId;
        this.scheduleTitle = scheduleTitle;
        this.scheduleDescription = scheduleDescription;
        this.location = location;
        this.participantLimit = participantLimit;
        this.deadline = deadline;
        this.scheduleDateTime = scheduleDateTime;
    }
}
