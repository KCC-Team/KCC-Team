package com.kcc.springmini.domain.schedule.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleVO implements Serializable {
    private Long meetUpId;
    private Long memberId;

    @Size(min = 5, max = 25, message = "5자 이상 25 이하로 입력해주세요.")
    private String scheduleTitle;

    @Length(max = 250, message = "250자 이하로 입력해주세요.")
    private String scheduleDescription;

    @Size(min = 5, max = 25, message = "5자 이상 25 이하로 입력해주세요.")
    private String location;

    private int participantLimit;

    private String deadline;

    @FutureOrPresent(message = "약속 시간은 현재 시간 이후여야 합니다.")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime scheduleDateTime;

    private String scheduleDateTimeString;

    public ScheduleVO(Long meetUpId, Long memberId, String scheduleTitle, String scheduleDescription, String location, int participantLimit, String deadline, LocalDateTime scheduleDateTime) {
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
