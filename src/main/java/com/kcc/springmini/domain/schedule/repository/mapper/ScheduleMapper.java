package com.kcc.springmini.domain.schedule.repository.mapper;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ScheduleMapper {
    void save(ScheduleVO scheduleVO);
    void delete(Long id);
    ScheduleVO findById(Long id);
    List<ScheduleVO> findAll(Map<String, Long> map);
    Long count(Long meetUpId);
}
