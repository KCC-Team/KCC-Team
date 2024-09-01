package com.kcc.springmini.domain.meetup.service;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.repository.MeetUpRepository;
import com.kcc.springmini.domain.meetup.repository.mapper.MeetUpMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MeetUpServiceImpl implements MeetUpService{

    private final MeetUpRepository meetUpRepository;

    @Override
    public List<MeetUpVO> findAll(Criteria cri) {
        return meetUpRepository.findAll(cri);
    }

    @Override
    public List<MeetUpVO> findByTitle(String title, Criteria cri) {
        return meetUpRepository.findByTitle(title, cri);
    }

    @Override
    public int getTotalCount(String title, Criteria cri) {
        return meetUpRepository.getTotalCount(title, cri);
    }

    @Override
    public int getMemberTotal(Long meetUpId) {
        return meetUpRepository.getMemberTotal(meetUpId);
    }
}
