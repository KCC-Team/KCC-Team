package com.kcc.springmini.domain.post.repository.mapper;

import com.kcc.springmini.domain.post.model.vo.PostVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PostMapper {
    public List<PostVO> findAll(Long meetUpId);
    public List<PostVO> findAllWithPaging(Map<String, Object> params);
    public PostVO findById(Long postId);
}
