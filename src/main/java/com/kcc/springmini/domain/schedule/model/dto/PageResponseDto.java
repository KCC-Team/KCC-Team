package com.kcc.springmini.domain.schedule.model.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class PageResponseDto implements Serializable {
    private int currentPage;
    private int startPage;
    private int endPage;

    private List<ScheduleListResponseDto> responses;
}
