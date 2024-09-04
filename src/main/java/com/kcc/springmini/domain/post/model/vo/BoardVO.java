package com.kcc.springmini.domain.post.model.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


@Data
public class BoardVO implements Serializable {
    private Long boardId;
    private Long meetupId;
    private Long memberId;
    private String title;
    private String content;
    private Date created_at;
    private Date updated_at;
}
