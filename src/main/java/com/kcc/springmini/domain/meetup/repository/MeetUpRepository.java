package com.kcc.springmini.domain.meetup.repository;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;

import java.util.List;
import java.util.Map;

public interface MeetUpRepository {
    List<MeetUpVO> findAll(Criteria cri);
    List<MeetUpVO> findByTitle(String title, Criteria cri);
    int getTotalCount(String title, Criteria cri);
    int getMemberTotal(Long memberId);
    void insertMeetup(MeetUpRequestDto dto);
    int isPass(Map<String, Long> map);
    void join(Map<String, Object> map);
    void insertQuestion(Map<String, Object> map);
}
