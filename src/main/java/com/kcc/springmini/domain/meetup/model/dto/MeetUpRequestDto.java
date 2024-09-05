package com.kcc.springmini.domain.meetup.model.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MeetUpRequestDto {
	private Long createMeetupId;
	private String title;
	private String intro;
	private String content;
	private Integer person;
	private String  category;
}
