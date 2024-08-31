package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleListResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;

import java.util.List;
import java.util.Map;

public interface ScheduleRepository {
    void save(ScheduleVO scheduleVO);
    void delete(Long id);
    ScheduleResponseDto findById(Long id);
    List<ScheduleListResponseDto> findAll(Map<String, Long> map);
    Long count(Long meetUpId);
}
