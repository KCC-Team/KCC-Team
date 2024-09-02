package com.kcc.springmini.domain.meetup.controller;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.dto.PageDto;
import com.kcc.springmini.domain.meetup.service.MeetUpService;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.service.PostService;
import com.kcc.springmini.domain.schedule.service.ScheduleService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/meetups")
public class MeetUpController {
    private final PostService postService;
    private final MeetUpService meetUpService;
    private final ScheduleService scheduleService;

    @GetMapping("/{meetUpId}")
    public String meetUp(@PathVariable("meetUpId") Long meetUpId,
    					Criteria cri,
                         HttpServletResponse response, Model model) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");

        List<PostVO> posts = postService.findAll(meetUpId); //전체 글 (총 게시글 갯수에만 사용)
        List<PostVO> totalPaging = postService.findAllWithPaging(cri, meetUpId); //페이징된 글 
        
        model.addAttribute("posts", totalPaging); //현 페이지에서 보여줄 글 목록
		model.addAttribute("pageMaker", new PageDto(cri, posts.size())); //페이징 수 ex.(|1|2|3|4|5)
        model.addAttribute("totalPosts", posts.size()); //총 게시글
        model.addAttribute("totalMembers", meetUpService.getMemberTotal(meetUpId)); //모임 인원
        model.addAttribute("meetupId", meetUpId);
        model.addAttribute("schedules", scheduleService.findAll(meetUpId, 1));

        return "meetup/meetupDetail";
    }
  
    @GetMapping("/register")
    public String register() {
        return "meetup/meetupRegister";
    }
    
    @PostMapping("/register")
    public String postMeetup(@ModelAttribute MeetUpRequestDto dto ,
    		@RequestPart(value = "file", required=false) MultipartFile file) {
 
    	meetUpService.insertMeetup(dto);
    	return "redirect:/";
    }
}
