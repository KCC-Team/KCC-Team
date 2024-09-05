package com.kcc.springmini.domain.reply.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kcc.springmini.domain.reply.model.Reply;
import com.kcc.springmini.domain.reply.model.dto.ReplyCreateRequestDto;
import com.kcc.springmini.domain.reply.model.dto.ReplyUpdateRequestDto;
import com.kcc.springmini.domain.reply.repository.mapper.ReplyMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReplyRepositoryImpl implements ReplyRepository{
	
	private final ReplyMapper replyMapper;
	
	
	@Override
	public Reply getReplyById(Long replyId) {
		return replyMapper.getReplyById(replyId);
	}

	@Override
	public List<Reply> getAllPostReplies(Long postId) {
		return replyMapper.getAllPostReplies(postId);
	}

	@Override
	public void insertReply(ReplyCreateRequestDto reply) {
		replyMapper.insertReply(reply);
	}

	@Override
	public void updateReply(ReplyUpdateRequestDto reply) {
		// TODO Auto-generated method stub
		
	}

}
