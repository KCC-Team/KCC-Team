package com.kcc.springmini.domain.reply.service;

import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.model.dto.ReplyCreateRequestDto;
import com.kcc.springmini.domain.reply.model.dto.ReplyUpdateRequestDto;

import java.util.List;

public interface ReplyService {
    Reply getReplyById(Long replyId);
    List<Reply> getAllPostReplies(Long postId);
    void updateReply(ReplyUpdateRequestDto reply);
    void insertReply(ReplyCreateRequestDto reply);
}
