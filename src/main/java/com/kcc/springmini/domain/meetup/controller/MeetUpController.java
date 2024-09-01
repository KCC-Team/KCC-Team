package com.kcc.springmini.domain.meetup.controller;

import com.kcc.springmini.domain.meetup.service.MeetUpService;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.service.PostService;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MeetUpController {
    private final PostService postService;
    private final MeetUpService meetUpService;

    @GetMapping("/meetups/{meetUpId}")
    public String meetUp(@PathVariable("meetUpId") Long meetUpId,
                         @RequestParam(defaultValue = "1") int pageNum,
                         @RequestParam(defaultValue = "5") int pageSize
            , Model model) {
        List<PostVO> posts = postService.findAll(meetUpId);
        List<PostVO> allWithPaging = postService.findAllWithPaging(meetUpId, pageNum, pageSize);

        System.out.println("1allWithPaging = " + allWithPaging.size());

        model.addAttribute("posts", allWithPaging);
        model.addAttribute("totalPosts", posts.size());
        model.addAttribute("totalMembers", meetUpService.getMemberTotal(meetUpId));

        return "meetup/meetupDetail";
    }


}
