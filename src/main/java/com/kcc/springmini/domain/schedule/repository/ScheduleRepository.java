package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleListResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;

import java.util.List;
import java.util.Map;

public interface ScheduleRepository {
    int save(ScheduleVO scheduleVO);
    int lockScheduleMember(Long scheduleId);
    int updateSchedulePerson(Long scheduleId);
    int saveMember(Map<String, Long> map);
    int delete(Long id);
    ScheduleResponseDto findById(Long id);
    List<ScheduleListResponseDto> findAll(Map<String, Long> map);
    Long count(Long meetUpId);
}
