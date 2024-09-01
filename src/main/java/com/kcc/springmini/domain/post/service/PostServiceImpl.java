package com.kcc.springmini.domain.post.service;

import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.repository.mapper.PostMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService{

    private final PostMapper postMapper;

    @Override
    public List<PostVO> findAll(Long meetUpId) {
        return postMapper.findAll(meetUpId);
    }

}
