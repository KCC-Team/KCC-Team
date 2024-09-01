package com.kcc.springmini.domain.post.controller;

import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.service.PostService;
import com.kcc.springmini.domain.post.service.PostServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class PostController {
    private final PostService postService;

    @GetMapping("/{meetUpId}")
    public void findAllPosts(@PathVariable("meetUpId") Long meetUpId) {
        System.out.println("call");
        List<PostVO> all = postService.findAll(meetUpId);
        for (PostVO postVO : all) {
            System.out.println(postVO);
        }
    }


    @GetMapping("/meetup/{meetUpId}/posts")
    public List<PostVO> getPosts(
            @PathVariable int meetUpId,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "5") int size
    ) {
        System.out.println("paging call");
        List<PostVO> allWithPaging = postService.findAllWithPaging(meetUpId, page, size);
        System.out.println(allWithPaging);
        return null;
    }


}
