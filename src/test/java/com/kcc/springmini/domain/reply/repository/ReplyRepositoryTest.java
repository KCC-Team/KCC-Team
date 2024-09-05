package com.kcc.springmini.domain.reply.repository;

import java.time.LocalDateTime;
import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;

import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.repository.MeetUpRepository;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.repository.MemberRepository;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.repository.mapper.PostMapper;
import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.schedule.repository.ScheduleRepository;

@MybatisTest(properties = "spring.profiles.active=test")
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class ReplyRepositoryTest {
	
//    @Autowired
//    private ReplyRepository replyRepository;
//
//    @Autowired
//    private MeetUpRepository meetUpRepository;
//
//    @Autowired
//    private MemberRepository memberRepository;
//    
//    @Autowired
//    private PostMapper postmapper;
//
//	
//	@BeforeEach
//    void setUp() {
//        memberRepository.save(MemberVO.builder()
//                .username("test")
//                .password("test")
//                .nickname("test")
//                .email("test@example.com")
//                .gender("M")
//                .birthdate(new Date("2024-09-04"))
//                .tel("010-1234-5678")
//                .address("서울시 강남구")
//                .build());
//
//        meetUpRepository.insertMeetup(MeetUpRequestDto.builder()
//                .title("test")
//                .intro("test")
//                .content("test")
//                .person(4)
//                .category("test")
//                .build());
//        
//        
//    }
	
//	@DisplayName("댓글번호로 댓글 1개 찾기")
//	@Test
//	void getReplyById() {
//		//given
//		Reply reply = Reply.builder()
//		.replyId(1L)
//		.content("test댓글")
//		.createdAt(LocalDateTime.now().toString())
//		.dept(0)
//		.orderNumber(0)
//		.topReplyId(null)
//		.updatedAt(LocalDateTime.now().toString())
//		.build();
//	
//		//when
//		//Reply findReply = replyRepository.getReplyById(replyId);
//		
//		//then
//		//assertThat(findReply.getContent()).equals(reply.getContent());
//		
//		
//	}
	
	
}
