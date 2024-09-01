package com.kcc.springmini.domain.post.service;

import com.kcc.springmini.domain.post.model.vo.PostVO;
import com.kcc.springmini.domain.post.repository.mapper.PostMapper;
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
    public List<PostVO> findAllWithPaging(int meetUpId, int currentPage, int pageSize) {
        int offset = (currentPage - 1) * pageSize;

        Map<String, Object> params = new HashMap<>();
        params.put("meetUpId", meetUpId);
        params.put("pageSize", pageSize);
        params.put("offset", offset);

        return postMapper.findAllWithPaging(params);
    }


}
