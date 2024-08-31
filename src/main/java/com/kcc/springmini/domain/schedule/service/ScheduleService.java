package com.kcc.springmini.domain.schedule.service;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.PageResponseDto;

public interface ScheduleService {
    void save(long meetupId, ScheduleVO scheduleVO);
    void delete(Long id);
    ScheduleVO findById(Long id);
    PageResponseDto findAll(Long meetUpId, int page);
}
