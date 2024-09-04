package com.kcc.springmini.domain.post.controller;

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

//    @GetMapping("/{meetUpId}")
//    public void findAllPosts(@PathVariable("meetUpId") Long meetUpId) {
//        System.out.println("call");
//        List<PostVO> all = postService.findAll(meetUpId);
//        for (PostVO postVO : all) {
//            System.out.println(postVO);
//        }
//    }


//    @GetMapping("/meetup/{meetUpId}/posts")
//    public List<PostVO> getPosts(
//            @PathVariable Long meetUpId,
//            @RequestParam(value = "page", defaultValue = "1") int page,
//            @RequestParam(value = "size", defaultValue = "5") int size
//    ) {
//        System.out.println("paging call");
//        List<PostVO> allWithPaging = postService.findAllWithPaging(meetUpId, page, size);
//        System.out.println(allWithPaging);
//        return null;
//    }

    @GetMapping("/posts/{postId}")
    public String postDetail(@PathVariable Long postId, Model model){
        System.out.println("asdasd");
        PostVO findPost = postService.findById(postId);
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
