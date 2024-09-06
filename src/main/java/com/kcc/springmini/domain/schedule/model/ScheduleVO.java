package com.kcc.springmini.domain.schedule.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ScheduleVO implements Serializable {
    private Long scheduleId;
    private Long meetUpId;
    private Long memberId;

    @NotBlank(message = "일정 제목을 입력해주세요.")
    @Size(min = 5, max = 25, message = "5자 이상 25 이하로 입력해주세요.")
    private String scheduleTitle;

    @NotBlank(message = "일정 설명을 입력해주세요.")
    @Length(max=250, message = "250자 이상 입력할 수 없습니다.")
    private String scheduleDescription;

    private String location;

    @NotNull(message = "참여 제한 인원을 입력해주세요.")
    @Max(value = 20, message = "20명 이하로 입력해주세요.")
    private Integer participantLimit;

    @NotNull(message = "마감 기한을 입력해주세요.")
    private String deadline;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private String scheduleDateTime;

    public ScheduleVO(Long scheduleId, Long meetUpId, Long memberId, String scheduleTitle, String scheduleDescription,
                      String location, Integer participantLimit, String deadline, String scheduleDateTime) {
        this.scheduleId = scheduleId;
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
