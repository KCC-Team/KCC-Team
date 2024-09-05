package com.kcc.springmini.domain.meetup.service;

import com.kcc.springmini.domain.common.mapper.FileMapper;
import com.kcc.springmini.domain.common.model.FileStatus;
import com.kcc.springmini.domain.common.utils.AwsS3Utils;
import com.kcc.springmini.domain.meetup.mapper.MeetUpMapper;
import com.kcc.springmini.domain.meetup.model.dto.AnswerDto;
import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.model.vo.Question;
import com.kcc.springmini.domain.member.model.dto.MemberQAResponseDto;
import com.kcc.springmini.global.auth.PrincipalDetail;
import com.kcc.springmini.global.exception.AlreadyExistException;
import com.kcc.springmini.global.exception.BadRequestException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MeetUpServiceImpl implements MeetUpService{
    private final MeetUpMapper meetUpMapper;
    private final FileMapper fileMapper;

    private final AwsS3Utils awsS3Utils;

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
    public int getMemberTotal(Long meetUpId) {
        return meetUpMapper.getMemberTotal(meetUpId);
    }

    @Override
    public boolean isPass(Long meetUpId, Long memberId) {
        Map<String, Long> map = Map.of("meetupId", meetUpId, "memberId", memberId);
        int pass = meetUpMapper.isPass(map);
        return pass == 1;
    }

    @Transactional
    @Override
    public void join(Long meetUpId, Long memberId, String grade) {
        if (isPass(meetUpId, memberId)) {
            throw new AlreadyExistException("이미 가입한 모임입니다.", HttpStatus.BAD_REQUEST);
        }
        
        Map<String, Object> map = Map.of("meetupId", meetUpId, "memberId", memberId, "grade", grade);
        meetUpMapper.join(map);
    }

    @Transactional
    @Override
	public void insertMeetup(MeetUpRequestDto dto, MultipartFile file) {
		meetUpMapper.insertMeetup(dto);
        Map<String, Object> map = new HashMap<>();

        map.put("fileOriginalName", file.getOriginalFilename());
        map.put("meetupId", dto.getCreateMeetupId());
        String fileName = UUID.randomUUID().toString();
        map.put("fileName", fileName);
        map.put("type", FileStatus.MEETUP.getValue());

        if (fileMapper.saveFile(map) == 1) {
            try {
                awsS3Utils.saveFile(file, fileName);
            } catch (IOException e) {
                throw new BadRequestException("파일 저장에 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
        }
		
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
    	meetUpMapper.insertQuestion(map);
    }

	@Override
	public List<Question> findQuestions(Long meetupId) {
		return meetUpMapper.findQuestions(meetupId);
	}

    @Transactional
	@Override
	public void insertAnswers(List<AnswerDto> answers) {
		for(AnswerDto answer : answers) {
			meetUpMapper.insertAnswers(answer);
		}
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
