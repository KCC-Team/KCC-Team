package com.kcc.springmini.domain.meetup.controller;

import com.kcc.springmini.domain.meetup.service.MeetUpService;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.service.PostService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/meetups")
public class MeetUpController {
    private final PostService postService;
    private final MeetUpService meetUpService;

    @GetMapping("/{meetUpId}")
    public String meetUp(@PathVariable("meetUpId") Long meetUpId, Model model) {
        List<PostVO> posts = postService.findAll(meetUpId);
        model.addAttribute("posts", posts);
        model.addAttribute("totalPosts", posts.size());
        model.addAttribute("totalMembers", meetUpService.getMemberTotal(meetUpId));

        return "meetup/meetupDetail";
    }

    @GetMapping("/register")
    public String register() {
        return "meetup/meetupRegister";
    }
}
