package com.kcc.springmini.domain.schedule.repository.mapper;

import com.kcc.springmini.domain.schedule.model.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    List<Schedule> findAll();
}
