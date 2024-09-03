package com.kcc.springmini.domain.member.repository;

import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.repository.mapper.MemberMapper;
import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MemberRepositoryImpl implements MemberRepository {

    private final MemberMapper memberMapper;

    @Override
    public MemberVO findById(String username) {
        return memberMapper.findById(username);
    }

    @Override
    public void save(MemberVO member) {
        memberMapper.save(member);
    }

    @Override
    public int update(MemberVO member) {
        return memberMapper.update(member);
    }

    @Override
    public int delete(String username) {
        return memberMapper.delete(username);
    }

    @Override
    public List<MeetUpVO> getMeetupList(String username) {
        return memberMapper.getMeetupList(username);
    }

    @Override
    public List<ScheduleVO> getScheduleList(String username) {
        return memberMapper.getScheduleList(username);
    }
}
