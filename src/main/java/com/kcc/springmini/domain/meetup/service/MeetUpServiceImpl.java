package com.kcc.springmini.domain.meetup.service;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.repository.MeetUpRepository;
import com.kcc.springmini.global.exception.AlreadyExistException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public boolean isPass(Long meetUpId, Long memberId) {
        Map<String, Long> map = Map.of("meetupId", meetUpId, "memberId", memberId);
        int pass = meetUpRepository.isPass(map);
        return pass == 1;
    }

    @Override
    public void join(Long meetUpId, Long memberId) {
        if (isPass(meetUpId, memberId)) {
            throw new AlreadyExistException("이미 가입한 모임입니다.", HttpStatus.BAD_REQUEST);
        }

        Map<String, Long> map = Map.of("meetupId", meetUpId, "memberId", memberId);
        meetUpRepository.join(map);
    }

    @Override
	public void insertMeetup(MeetUpRequestDto dto) {
		meetUpRepository.insertMeetup(dto);
	}
}
