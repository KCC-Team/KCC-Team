package com.kcc.springmini.domain.meetup.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Question implements Serializable{
	private Long questionId;
	private String content;
}
