package com.kcc.springmini.domain.meetup.controller;

import com.kcc.springmini.domain.meetup.model.dto.MeetUpRequestDto;
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
                         @RequestParam(defaultValue = "1") int pageNum,
                         @RequestParam(defaultValue = "5") int pageSize,
                         HttpServletResponse response, Model model) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");

        List<PostVO> posts = postService.findAll(meetUpId);
        List<PostVO> allWithPaging = postService.findAllWithPaging(meetUpId, pageNum, pageSize);

        System.out.println("1allWithPaging = " + allWithPaging.size());

        model.addAttribute("posts", allWithPaging);
        model.addAttribute("totalPosts", posts.size());
        model.addAttribute("totalMembers", meetUpService.getMemberTotal(meetUpId));
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
    	System.out.println("postMeetup call");
    	System.out.println(file.getOriginalFilename());
    	System.out.println(dto);
    	
    	meetUpService.insertMeetup(dto);
    	
    	return "redirect:/";
    }
}
