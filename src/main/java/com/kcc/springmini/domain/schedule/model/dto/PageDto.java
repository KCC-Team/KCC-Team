package com.kcc.springmini.domain.schedule.model.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class PageDto {
    private int currentPage;
    private int totalPage;
    private int startPage;
    private int endPage;
}
