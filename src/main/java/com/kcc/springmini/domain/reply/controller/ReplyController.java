package com.kcc.springmini.domain.reply.controller;

import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.model.dto.ReplyCreateRequestDto;
import com.kcc.springmini.domain.reply.model.dto.ReplyRequestDto;
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
        principalDetails.getMember().getMemberId();
    	System.out.println("asd");
        System.out.println("reply = " + reply);
        replyService.insertReply(reply);

    }

    @PutMapping("/reply")
    public void updateReply(@RequestBody ReplyRequestDto reply) {
        replyService.updateReply(reply);
    }
}
