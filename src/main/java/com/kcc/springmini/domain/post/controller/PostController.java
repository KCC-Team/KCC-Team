package com.kcc.springmini.domain.post.controller;

import com.kcc.springmini.domain.common.config.EnvVariableProperties;
import com.kcc.springmini.domain.common.service.FileService;
import com.kcc.springmini.domain.post.model.vo.BoardVO;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.service.PostService;
import com.kcc.springmini.domain.post.service.PostServiceImpl;
import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.service.ReplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class PostController {
    private final PostService postService;
    private final ReplyService replyService;

    private final EnvVariableProperties properties;

    @GetMapping("/posts/{postId}")
    public String postDetail(@PathVariable Long postId, Model model){
        PostVO findPost = postService.findById(postId);
        findPost.setFileUrl(properties.getS3().getUrl() + findPost.getFileUrl());
        System.out.println(findPost);
        List<Reply> allPostReplies = replyService.getAllPostReplies(postId);
        model.addAttribute("replies", allPostReplies);
        model.addAttribute("post",findPost);
        return "meetup/postDetail";
    }

    @PostMapping("/posts/create")
    public RedirectView create(BoardVO board) {
        Long meetupId = board.getMeetupId();
        postService.create(board);
        return new RedirectView("/meetups/" + meetupId);
    }

}
