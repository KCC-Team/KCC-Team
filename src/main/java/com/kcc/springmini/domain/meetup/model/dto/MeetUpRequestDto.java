package com.kcc.springmini.domain.meetup.model.dto;

import lombok.*;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MeetUpRequestDto {
	private Long createMeetupId;
	
	@NotBlank(message = "제목은 필수 항목이며, 비워둘 수 없습니다.")
	private String title;
	
	@NotBlank(message = "소개는 필수 항목이며, 비워둘 수 없습니다.")
	private String intro;

	@NotNull(message = "참여 인원 수는 필수 항목입니다.")
	@Min(value = 1, message = "참여 인원은 최소 1명 이상이어야 합니다.")
	private Integer person;
	
	@NotBlank(message = "카테고리는 필수 항목입니다.")
	private String  category;
	
	@NotNull(message = "즉시가입 여부는 필수 항목입니다.")
	private Boolean isInstantJoin; // 즉시가입 여부를 나타내는 필드

	@AssertTrue(message = "승인 가입의 경우 질문 목록이 비어 있으면 안 됩니다.")   
	public boolean isContentListValid() {
		// 즉시가입이 아닐 때 contentList가 비어있으면 안됨
		return isInstantJoin || (contentList != null && !contentList.isEmpty());
	}

	
	private List<String> contentList; // 가입 질문 목록
}
