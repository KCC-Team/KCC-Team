package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
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
    public void save(ScheduleVO scheduleVO) {
        scheduleMapper.save(scheduleVO);
    }

    @Override
    public void delete(Long id) {
        scheduleMapper.delete(id);
    }

    @Override
    public ScheduleVO findById(Long id) {
        return scheduleMapper.findById(id);
    }

    @Override
    public List<ScheduleVO> findAll(Map<String, Long> map) {
        return scheduleMapper.findAll(map);
    }

    @Override
    public Long count(Long meetUpId) {
        return scheduleMapper.count(meetUpId);
    }
}
