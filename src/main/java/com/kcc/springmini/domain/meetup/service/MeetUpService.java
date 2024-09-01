package com.kcc.springmini.domain.meetup.service;


import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;

import java.util.List;

public interface MeetUpService {
    List<MeetUpVO> findAll(Criteria cri);
    List<MeetUpVO> findByTitle(String title, Criteria cri);
    int getTotalCount(String title, Criteria cri);
    int getMemberTotal(Long memberId);
}
