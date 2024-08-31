package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.Schedule;

import java.util.List;
import java.util.Map;

public interface ScheduleRepository {
    void save(Schedule schedule);
    void update(Schedule schedule);
    void delete(Long id);
    Schedule findById(Long id);
    List<Schedule> findAll(Map<String, Long> map);
}
