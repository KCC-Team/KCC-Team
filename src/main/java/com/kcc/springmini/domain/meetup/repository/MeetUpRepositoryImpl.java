package com.kcc.springmini.domain.meetup.repository;

import com.kcc.springmini.domain.meetup.controller.AnswerDto;
import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.model.vo.Question;
import com.kcc.springmini.domain.meetup.repository.mapper.MeetUpMapper;
import com.kcc.springmini.domain.member.model.dto.MemberQAResponseDto;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

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

    @Override
    public int isPass(Map<String, Long> map) {
        return meetUpMapper.isPass(map);
    }

    @Override
    public void join(Map<String, Object> map) {
        meetUpMapper.join(map);
    }

    @Override
	public void insertMeetup(MeetUpRequestDto dto) {
		meetUpMapper.insertMeetup(dto);
	}

	@Override
	public void insertQuestion(Map<String, Object> map) {
		meetUpMapper.insertQuestion(map);
	}

	@Override
	public List<Question> findQuestions(Long meetUpId) {
		return meetUpMapper.findQuestions(meetUpId);
	}


	@Override
	public void insertAnswers(AnswerDto answer) {
		meetUpMapper.insertAnswers(answer);
	}

	@Override
	public List<Long> selectMeetUpId(Long memberId) {
		return meetUpMapper.selectMeetUpId(memberId);
	}

	@Override
	public MemberQAResponseDto findMemberQA(Long meetUpId) {
		return meetUpMapper.findMemberQA(meetUpId);
	}

    @Override
    public Optional<MeetUpVO> findById(Long meetUpId) {
        return meetUpMapper.findById(meetUpId);
    }
}
