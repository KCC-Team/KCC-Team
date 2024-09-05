package com.kcc.springmini.domain.post.service;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.post.model.vo.BoardVO;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.mapper.PostMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService{
    private final PostMapper postMapper;

    @Override
    public List<PostVO> findAll(Long meetUpId) {
        return postMapper.findAll(meetUpId);
    }

    @Override
    public List<PostVO> findAllWithPaging(Criteria cri, Long meetUpId) {
    	Map<String, Object> params = new HashMap<>();
    	params.put("cri", cri);
    	params.put("meetUpId", meetUpId);
        return postMapper.findAllWithPaging(params);
    }

    @Override
    public PostVO findById(Long postId) {
        return postMapper.findById(postId);
    }

    @Override
    public void create(BoardVO board) {
        postMapper.create(board);
    }

}
