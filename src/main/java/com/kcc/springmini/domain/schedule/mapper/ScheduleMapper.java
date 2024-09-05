package com.kcc.springmini.domain.schedule.mapper;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleListResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ScheduleMapper {
    int save(ScheduleVO scheduleVO);
    int lockScheduleMember(Long scheduleId);
    int isParticipated(Map<String, Long> map);
    int update(@Param("id")Long id, @Param("scheduleVO") ScheduleVO scheduleVO);
    int saveMember(Map<String, Long> map);
    int delete(@Param("id") Long id, @Param("memberId") Long memberId);
    ScheduleResponseDto findById(Long id);
    List<ScheduleListResponseDto> findAll(Map<String, Object> map);
    Long count(Long meetUpId);
    void checkDeadline();
}
