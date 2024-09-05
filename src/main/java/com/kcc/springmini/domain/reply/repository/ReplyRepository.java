package com.kcc.springmini.domain.reply.repository;

import java.util.List;

import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.model.dto.ReplyCreateRequestDto;
import com.kcc.springmini.domain.reply.model.dto.ReplyUpdateRequestDto;

public interface ReplyRepository {
	Reply getReplyById(Long replyId);
    List<Reply> getAllPostReplies(Long postId);
    void insertReply(ReplyCreateRequestDto reply);
    void updateReply(ReplyUpdateRequestDto reply);
}
