package com.kcc.springmini.domain.reply.model;

import com.kcc.springmini.domain.member.model.vo.MemberVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Data
public class Reply implements Serializable {
    private Long replyId;
    private MemberVO writer;
    private String content;
    private String createdAt;
    private String updatedAt;
    private int dept;
    private int orderNumber;
    private Long topReplyId;
	private String fileUrl;
}
