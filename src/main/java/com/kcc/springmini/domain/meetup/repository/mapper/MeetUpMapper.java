package com.kcc.springmini.domain.meetup.repository.mapper;

import com.kcc.springmini.domain.meetup.controller.AnswerDto;
import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.model.vo.Question;
import com.kcc.springmini.domain.member.model.dto.MemberQAResponseDto;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface MeetUpMapper {
    List<MeetUpVO> findAll(Criteria cri);
    List<MeetUpVO> findByTitle(@Param("title") String title, @Param("cri") Criteria cri);
    int getTotalCount(@Param("title") String title, @Param("cri") Criteria cri);
    int getMemberTotal(Long meetUpId);
    int isPass(Map<String, Long> map);
    void insertMeetup(MeetUpRequestDto dto);
    void join(Map<String, Object> map);
    void insertQuestion(Map<String, Object> map);
    List<Question> findQuestions(Long meetUpId); 
    void insertAnswers(AnswerDto answer);
    List<Long> selectMeetUpId(Long memberId);
    MemberQAResponseDto findMemberQA(Long meetUpId);
}
