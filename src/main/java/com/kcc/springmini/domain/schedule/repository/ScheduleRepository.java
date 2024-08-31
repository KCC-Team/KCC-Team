package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;

import java.util.List;
import java.util.Map;

public interface ScheduleRepository {
    void save(ScheduleVO scheduleVO);
    void delete(Long id);
    ScheduleVO findById(Long id);
    List<ScheduleVO> findAll(Map<String, Long> map);
    Long count(Long meetUpId);
}
