package com.kcc.springmini.domain.member.model.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class QuestionAnswer implements Serializable {
	private int questionId;
    private String answer;
    private String nickname;
    private Long memberId;
    private String questionContent;
}