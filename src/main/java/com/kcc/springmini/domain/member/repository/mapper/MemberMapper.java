package com.kcc.springmini.domain.member.repository.mapper;

import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.member.model.dto.MemberApproveRequestDto;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapper {
    MemberVO findById(String username);
    void save(MemberVO member);
    int update(MemberVO member);
    int delete(String username);
    int isApplied(Map<String, Long> map);
    List<MeetUpVO> getMeetupList(String username);
    List<ScheduleVO> getScheduleList(String username);
    void deletePendingMember(MemberApproveRequestDto dto);
}