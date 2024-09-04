package com.kcc.springmini.domain.meetup.controller;

import java.util.Map;

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
