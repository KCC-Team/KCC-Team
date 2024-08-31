package com.kcc.springmini.domain.schedule.service;

import com.kcc.springmini.domain.schedule.model.Schedule;

import java.util.List;

public interface ScheduleService {
    void save(long meetupId, Schedule schedule);
    void delete(Long id);
    Schedule findById(Long id);
    List<Schedule> findAll(Long meetUpId, int page);
}
