package com.kcc.springmini.domain.meetup.repository;

import com.kcc.springmini.domain.meetup.controller.AnswerDto;
import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.model.vo.Question;
import com.kcc.springmini.domain.member.model.dto.MemberQAResponseDto;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface MeetUpRepository {
    List<MeetUpVO> findAll(Criteria cri);
    List<MeetUpVO> findByTitle(String title, Criteria cri);
    int getTotalCount(String title, Criteria cri);
    int getMemberTotal(Long memberId);
    void insertMeetup(MeetUpRequestDto dto);
    int isPass(Map<String, Long> map);
    void join(Map<String, Object> map);
    void insertQuestion(Map<String, Object> map);
    List<Question> findQuestions(Long meetUpId); 
    void insertAnswers(AnswerDto answer);
    List<Long> selectMeetUpId(Long memberId);
    MemberQAResponseDto findMemberQA(Long meetUpId);
    Optional<MeetUpVO> findById(Long meetUpId);
}
