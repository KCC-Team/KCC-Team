package com.kcc.springmini.domain.post.service;

import com.kcc.springmini.domain.post.model.vo.PostVO;

import java.util.List;

public interface PostService {
    List<PostVO> findAll(Long meetUpId);
    List<PostVO> findAllWithPaging(int meetUpId, int currentPage, int pageSize);
}
