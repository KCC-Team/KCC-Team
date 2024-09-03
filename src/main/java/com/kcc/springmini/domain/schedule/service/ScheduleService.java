package com.kcc.springmini.domain.schedule.service;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.PageResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;

public interface ScheduleService {
    void save(MemberVO member, Long meetupId, ScheduleVO scheduleVO);
    void participateSchedule(Long meetupId, Long scheduleId, Long memberId);
    void delete(Long id);
    ScheduleResponseDto findById(Long id);
    PageResponseDto findAll(Long meetUpId, int page);
    void checkDeadline();
}
