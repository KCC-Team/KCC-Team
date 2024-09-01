package com.kcc.springmini.domain.reply.service;

import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.model.dto.ReplyCreateRequestDto;
import com.kcc.springmini.domain.reply.model.dto.ReplyRequestDto;
import com.kcc.springmini.domain.reply.repository.mapper.ReplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.SQLOutput;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService {

    private final ReplyMapper mapper;

    @Override
    public Reply getReplyById(Long replyId) {
        Reply findReply = mapper.getReplyById(replyId);
        System.out.println(findReply.getReplyId());
        return findReply;
    }

    @Override
    public List<Reply> getAllPostReplies(Long postId) {
        List<Reply> allPostReplies = mapper.getAllPostReplies(postId);
        return allPostReplies;
    }



    @Override
    public void updateReply(ReplyRequestDto reply) {
         mapper.updateReply(reply);
    }

    @Override
    public void insertReply(ReplyCreateRequestDto reply) {
        if(reply.getParentId() != null){
            Reply parentReply = getReplyById(reply.getParentId());
            reply.setDept(parentReply.getDept() + 1);
            reply.setOrderNumber(parentReply.getOrderNumber());
        } else {
            System.out.println("insert reply parentreply null");
            reply.setDept(0);
            reply.setOrderNumber(getAllPostReplies(reply.getPostId()).size());
        }
        System.out.println(reply);
        mapper.insertReply(reply);
    }
}
