package com.kcc.springmini.domain.meetup.model.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MeetUpRequestDto {
	private String title;
	private String intro;
	private String content;
	private Integer person;
	private String  category;
	private MultipartFile file;
	private Long createMeetupId;
}
