package com.kcc.springmini.domain.schedule.repository.mapper;

import com.kcc.springmini.domain.schedule.model.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ScheduleMapper {
    void save(Schedule schedule);
    void update(Schedule schedule);
    void delete(Long id);
    Schedule findById(Long id);
    List<Schedule> findAll(Map<String, Long> map);
}
