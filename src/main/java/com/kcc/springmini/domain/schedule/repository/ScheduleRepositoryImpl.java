package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.Schedule;
import com.kcc.springmini.domain.schedule.repository.mapper.ScheduleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ScheduleRepositoryImpl implements ScheduleRepository {
    private final ScheduleMapper scheduleMapper;

    @Override
    public List<Schedule> findAll() {
        return scheduleMapper.findAll();
    }
}
