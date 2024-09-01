package com.kcc.springmini.domain.schedule.repository;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleListResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;
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
    public int save(ScheduleVO scheduleVO) {
        return scheduleMapper.save(scheduleVO);
    }

    @Override
    public int lockScheduleMember(Long scheduleId) {
        return scheduleMapper.lockScheduleMember(scheduleId);
    }

    @Override
    public int updateSchedulePerson(Long scheduleId) {
        return scheduleMapper.updateSchedulePerson(scheduleId);
    }

    @Override
    public int saveMember(Map<String, Long> map) {
        return scheduleMapper.saveMember(map);
    }

    @Override
    public int delete(Long id) {
        return scheduleMapper.delete(id);
    }

    @Override
    public ScheduleResponseDto findById(Long id) {
        return scheduleMapper.findById(id);
    }

    @Override
    public List<ScheduleListResponseDto> findAll(Map<String, Long> map) {
        return scheduleMapper.findAll(map);
    }

    @Override
    public Long count(Long meetUpId) {
        return scheduleMapper.count(meetUpId);
    }
}
