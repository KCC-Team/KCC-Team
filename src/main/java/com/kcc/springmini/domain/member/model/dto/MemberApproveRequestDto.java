package com.kcc.springmini.domain.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MemberApproveRequestDto {
	private Long memberId;
	private Long meetUpId;
}
