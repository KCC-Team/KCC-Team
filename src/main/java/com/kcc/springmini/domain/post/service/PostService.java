package com.kcc.springmini.domain.post.service;

import com.kcc.springmini.domain.post.model.vo.PostVO;

import java.util.List;

public interface PostService {
    public List<PostVO> findAll(Long meetUpId);
}
