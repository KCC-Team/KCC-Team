package com.kcc.springmini.domain.reply.controller;

import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.service.PostService;
import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.model.dto.ReplyCreateRequestDto;
import com.kcc.springmini.domain.reply.model.dto.ReplyUpdateRequestDto;
import com.kcc.springmini.domain.reply.service.ReplyService;
import com.kcc.springmini.domain.reply.service.ReplyServiceImpl;
import com.kcc.springmini.global.auth.PrincipalDetail;

import lombok.RequiredArgsConstructor;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;
    private final PostService postService;

    @GetMapping("/reply/{replyId}")
    public void getReply(@PathVariable Long replyId) {
        replyService.getReplyById(replyId);
    }

    @GetMapping("/replies")
    public String getPostAllReplies(@RequestParam("post") Long postId, Model model) {
        List<Reply> allPostReplies = replyService.getAllPostReplies(postId);
        System.out.println("allPostReplies = " + allPostReplies);
        model.addAttribute("postId", postId);
        model.addAttribute("replies", allPostReplies);
        System.out.println("meetup");
        return "meetup/postDetail";
    }


    @PostMapping("/reply")
    public void insertReply(@RequestBody ReplyCreateRequestDto reply, @AuthenticationPrincipal PrincipalDetail principalDetails) {
    	 System.out.println("postcall");
    	PostVO post = postService.findById(reply.getPostId());
    	reply.setMeetupId(post.getMeetupId());
    	reply.setMemberId(principalDetails.getMember().getMemberId());
        replyService.insertReply(reply);

    }

    @PutMapping("/reply")
    public void updateReply(@RequestBody ReplyUpdateRequestDto reply) {
    	 System.out.println("put call");
    	System.out.println(reply);
    	replyService.updateReply(reply);
    }
}
