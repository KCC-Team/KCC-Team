package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.Schedule;

import java.util.List;

public interface ScheduleRepository {
    List<Schedule> findAll();
}
