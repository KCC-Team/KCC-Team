package com.kcc.springmini.domain.post.model.vo;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import lombok.Data;

import java.io.Serializable;

@Data
public class ReplyVO implements Serializable {
    private Long replyId;
    //private PostVO post;
    private MemberVO writer;
    private String content;
    private String createdAt;
    private String updatedAt;
    private int dept;
    private int orderNumber;
    private Long topReplyId;
}
