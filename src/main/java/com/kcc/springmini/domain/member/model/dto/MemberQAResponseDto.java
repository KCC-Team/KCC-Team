package com.kcc.springmini.domain.member.model.dto;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class MemberQAResponseDto implements Serializable {
	private int meetUpId;
	private String meetUpTitle;
    private List<QuestionAnswer> answerDetails;
}
