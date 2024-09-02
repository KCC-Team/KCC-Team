package com.kcc.springmini.domain.meetup.repository.mapper;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MeetUpMapper {
    List<MeetUpVO> findAll(Criteria cri);
    List<MeetUpVO> findByTitle(@Param("title") String title, @Param("cri") Criteria cri);
    int getTotalCount(@Param("title") String title, @Param("cri") Criteria cri);
    int getMemberTotal(Long meetUpId);
    void insertMeetup(MeetUpRequestDto dto);
}
