package com.kcc.springmini.domain.reply.repository.mapper;

import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.model.dto.ReplyCreateRequestDto;
import com.kcc.springmini.domain.reply.model.dto.ReplyUpdateRequestDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {
    Reply getReplyById(Long replyId);
    List<Reply> getAllPostReplies(Long postId);
    void insertReply(ReplyCreateRequestDto reply);
    void updateReply(ReplyUpdateRequestDto reply);
}
