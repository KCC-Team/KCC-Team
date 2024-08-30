package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.Schedule;
import com.kcc.springmini.domain.schedule.repository.mapper.ScheduleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ScheduleRepositoryImpl implements ScheduleRepository {
    private final ScheduleMapper scheduleMapper;

    @Override
    public void save(Schedule schedule) {
        scheduleMapper.save(schedule);
    }

    @Override
    public void update(Schedule schedule) {

    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public Schedule findById(Long id) {
        return null;
    }

    @Override
    public List<Schedule> findAll(Map<String, Long> map) {
        return scheduleMapper.findAll(map);
    }
}
