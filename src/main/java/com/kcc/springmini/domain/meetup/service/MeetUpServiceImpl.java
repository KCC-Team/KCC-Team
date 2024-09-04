package com.kcc.springmini.domain.meetup.service;

import com.kcc.springmini.domain.meetup.controller.AnswerDto;
import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.model.vo.Question;
import com.kcc.springmini.domain.meetup.repository.MeetUpRepository;
import com.kcc.springmini.domain.member.model.dto.MemberQAResponseDto;
import com.kcc.springmini.global.auth.PrincipalDetail;
import com.kcc.springmini.global.exception.AlreadyExistException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
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

    @Transactional
    @Override
    public void join(Long meetUpId, Long memberId, String grade) {
        if (isPass(meetUpId, memberId)) {
            throw new AlreadyExistException("이미 가입한 모임입니다.", HttpStatus.BAD_REQUEST);
        }
        
        Map<String, Object> map = Map.of("meetupId", meetUpId, "memberId", memberId, "grade", grade);
        meetUpRepository.join(map);
    }

    @Transactional
    @Override
	public void insertMeetup(MeetUpRequestDto dto) {
		meetUpRepository.insertMeetup(dto);
		
		Long meetupId = dto.getCreateMeetupId();
		
		PrincipalDetail principalDetail = 
				(PrincipalDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memberId = principalDetail.getMember().getMemberId();
		
		join(meetupId, memberId, "모임장");
		insertQuestion(meetupId, dto.getContent());
	}

    @Transactional
    @Override
    public void insertQuestion(Long meetupId, String content) {
    	Map<String, Object> map = Map.of("meetupId", meetupId, "content", content);
    	meetUpRepository.insertQuestion(map);
    }

	@Override
	public List<Question> findQuestions(Long meetupId) {
		return meetUpRepository.findQuestions(meetupId);
	}

    @Transactional
	@Override
	public void insertAnswers(List<AnswerDto> answers) {
		for(AnswerDto answer : answers) {
			meetUpRepository.insertAnswers(answer);
		}
	}

	@Override
	public List<Long> selectMeetUpId(Long memberId) {
		return meetUpRepository.selectMeetUpId(memberId);
	}

	@Override
	public MemberQAResponseDto findMemberQA(Long meetUpId) {
		return meetUpRepository.findMemberQA(meetUpId);
	}

	
  @Override
  public Optional<MeetUpVO> findById(Long meetUpId) {
      return meetUpRepository.findById(meetUpId);
  }
}
