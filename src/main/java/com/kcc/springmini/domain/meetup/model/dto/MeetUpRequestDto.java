package com.kcc.springmini.domain.meetup.model.dto;

import lombok.*;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MeetUpRequestDto {
	private Long createMeetupId;
	private String title;
	private String intro;
	private List<String> contentList;
	private Integer person;
	private String  category;
	private MultipartFile file;
}
