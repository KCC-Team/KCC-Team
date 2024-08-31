package com.kcc.springmini.domain.schedule.repository.mapper;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleListResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ScheduleMapper {
    void save(ScheduleVO scheduleVO);
    void delete(Long id);
    ScheduleResponseDto findById(Long id);
    List<ScheduleListResponseDto> findAll(Map<String, Long> map);
    Long count(Long meetUpId);
}
