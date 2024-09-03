package com.kcc.springmini.domain.reply.model.dto;

import lombok.Data;

@Data
public class ReplyCreateRequestDto {
    private Long postId;
    private Long parentId;
    private Long memberId;
    private String content;
    private int dept;
    private int orderNumber;
    private Long meetupId;
}
