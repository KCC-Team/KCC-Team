package com.kcc.springmini.domain.post.service;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.post.model.vo.PostVO;

import java.util.List;

public interface PostService {
    List<PostVO> findAll(Long meetUpId);
    List<PostVO> findAllWithPaging(Criteria cri, Long meetUpId);
    PostVO findById(Long postId);
}
