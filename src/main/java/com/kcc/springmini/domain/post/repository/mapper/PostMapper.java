package com.kcc.springmini.domain.post.repository.mapper;

import com.kcc.springmini.domain.post.model.vo.PostVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    public List<PostVO> findAll(Long meetUpId);
}
