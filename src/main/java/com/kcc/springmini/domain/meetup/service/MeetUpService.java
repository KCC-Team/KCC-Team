package com.kcc.springmini.domain.meetup.service;


import com.kcc.springmini.domain.meetup.controller.AnswerDto;
import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.model.vo.Question;
import com.kcc.springmini.domain.member.model.dto.MemberQAResponseDto;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface MeetUpService {
	void insertMeetup(MeetUpRequestDto dto);
    List<MeetUpVO> findAll(Criteria cri);
    List<MeetUpVO> findByTitle(String title, Criteria cri);
    int getTotalCount(String title, Criteria cri);
    int getMemberTotal(Long memberId);
    boolean isPass(Long meetUpId, Long memberId);
    void join(Long meetUpId, Long memberId, String grade);
    void insertQuestion(Long meetUpId,String content);
    List<Question> findQuestions(Long meetupId);
    void insertAnswers(List<AnswerDto> answers);
    List<Long> selectMeetUpId(Long memberId);
    MemberQAResponseDto findMemberQA(Long meetUpId);
    Optional<MeetUpVO> findById(Long meetUpId);
}
