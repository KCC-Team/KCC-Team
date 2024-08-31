package com.kcc.springmini.domain.common.model;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class PageRequestDto {
    private int postPageNumber;
    private int schedulePageNumber;
}
