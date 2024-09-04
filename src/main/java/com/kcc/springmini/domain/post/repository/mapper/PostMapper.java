package com.kcc.springmini.domain.post.repository.mapper;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.post.model.vo.BoardVO;
import com.kcc.springmini.domain.post.model.vo.PostVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PostMapper {
    List<PostVO> findAll(Long meetUpId);
    List<PostVO> findAllWithPaging(Map<String, Object> params);
    int getTotalCount(Long meetUpId);
    PostVO findById(Long postId);
    void create(BoardVO board);
}
