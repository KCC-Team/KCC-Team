package com.kcc.springmini.domain.meetup.controller;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
import com.kcc.springmini.domain.meetup.model.dto.PageDto;
import com.kcc.springmini.domain.meetup.service.MeetUpService;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.service.PostService;
import com.kcc.springmini.domain.schedule.service.ScheduleService;
import com.kcc.springmini.global.auth.PrincipalDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    public String meetUp(@AuthenticationPrincipal PrincipalDetail principalDetail,
            @PathVariable("meetUpId") Long meetUpId,
    					 Criteria cri, Model model) {

        List<PostVO> posts = postService.findAll(meetUpId);
        List<PostVO> allWithPaging = postService.findAllWithPaging(cri, meetUpId);

        model.addAttribute("posts", allWithPaging);
        model.addAttribute("totalPosts", posts.size());
        model.addAttribute("totalMembers", meetUpService.getMemberTotal(meetUpId));
        model.addAttribute("meetupId", meetUpId);
        model.addAttribute("schedules", scheduleService.findAll(meetUpId, 1));
        model.addAttribute("pageMaker", new PageDto(cri, posts.size())); //페이징 수 ex.(|1|2|3|4|5)
        if (principalDetail != null) {
            boolean pass = meetUpService.isPass(meetUpId, principalDetail.getMember().getMemberId());
            model.addAttribute("isPass", pass ? 1 : 0);
        } else {
            model.addAttribute("isPass", 0);
        }

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

    // 모임 참가
    @PostMapping("/{meetUpId}/join")
    public String joinMeetup(@AuthenticationPrincipal PrincipalDetail principalDetail,
                             @PathVariable("meetUpId") Long meetUpId) {
        if (principalDetail == null) {
            return "redirect:/login";
        }

        meetUpService.join(meetUpId, principalDetail.getMember().getMemberId());
        return "redirect:/meetups/" + meetUpId;
    }
}
