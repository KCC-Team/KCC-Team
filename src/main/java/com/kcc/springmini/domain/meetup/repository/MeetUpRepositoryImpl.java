package com.kcc.springmini.domain.meetup.repository;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.repository.mapper.MeetUpMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MeetUpRepositoryImpl implements MeetUpRepository {

    private final MeetUpMapper meetUpMapper;

    @Override
    public List<MeetUpVO> findAll(Criteria cri) {
        return meetUpMapper.findAll(cri);
    }

    @Override
    public List<MeetUpVO> findByTitle(String title, Criteria cri) {
        return meetUpMapper.findByTitle(title, cri);
    }

    @Override
    public int getTotalCount(String title, Criteria cri) {
        return meetUpMapper.getTotalCount(title, cri);
    }

    @Override
    public int getMemberTotal(Long memberId) {
        return meetUpMapper.getMemberTotal(memberId);
    }
}
