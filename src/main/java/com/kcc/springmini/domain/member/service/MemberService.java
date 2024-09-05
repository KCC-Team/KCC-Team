package com.kcc.springmini.domain.member.service;

import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.member.model.dto.MemberApproveRequestDto;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MemberService {
    MemberVO findById(String username);
    void save(MemberVO member, MultipartFile file);
    int update(MemberVO member);
    int delete(String username);
    List<MeetUpVO> getMeetupList(String username);
    List<ScheduleVO> getScheduleList(String username);
    void deletePendingMember(MemberApproveRequestDto dto);
}
