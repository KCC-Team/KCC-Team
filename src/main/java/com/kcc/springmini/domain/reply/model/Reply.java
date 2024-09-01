package com.kcc.springmini.domain.reply.model;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import lombok.Getter;

import java.io.Serializable;

@Getter
public class Reply implements Serializable {
    private Long replyId;
    private MemberVO writer;
    private String content;
    private String createdAt;
    private String updatedAt;
    private int dept;
    private int orderNumber;
    private Long topReplyId;

    @Override
    public String toString() {
        return "Reply{" +
                "replyId=" + replyId +
                ", writer=" + writer +
                ", content='" + content + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                ", dept=" + dept +
                ", orderNumber=" + orderNumber +
                ", topReplyId=" + topReplyId +
                '}';
    }
}
