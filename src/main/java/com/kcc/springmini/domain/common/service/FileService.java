package com.kcc.springmini.domain.common.service;

import com.kcc.springmini.domain.common.mapper.FileMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FileService {
    private final FileMapper fileMapper;

    public String getUrl(Map<String, Object> map) {
        return fileMapper.getUrl(map);
    }
}
