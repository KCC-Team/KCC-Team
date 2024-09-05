package com.kcc.springmini.domain.common.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class FileResponseDto {
    private String meetUpFileUrl;
    private List<String> postFileUrls;
}
