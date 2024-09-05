package com.kcc.springmini.domain.meetup.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AnswerDto {
	 private Long memberId;
	 private Long questionId;
	 private String answer;
	 private Long meetupId;
}
