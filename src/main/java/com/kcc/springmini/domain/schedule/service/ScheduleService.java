package com.kcc.springmini.domain.schedule.service;

import com.kcc.springmini.domain.schedule.model.Schedule;

import java.util.List;

public interface ScheduleService {
    List<Schedule> findAll();
}
