package com.kcc.springmini.domain.meetup.service;

import com.kcc.springmini.domain.meetup.repository.mapper.MeetUpMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MeetUpServiceImpl implements MeetUpService{

    private final MeetUpMapper mapper;

    @Override
    public int getMemberTotal(Long meetUpId) {
        return mapper.getMemberTotal(meetUpId);
    }
}
