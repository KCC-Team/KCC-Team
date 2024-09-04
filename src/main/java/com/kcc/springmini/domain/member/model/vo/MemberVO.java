package com.kcc.springmini.domain.member.model.vo;

import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberVO implements Serializable {
    private Long memberId;

    @Size(min = 2, max = 20, message = "아이디는 최소 2자 이상 최대 30자까지 입력 부탁드립니다.")
    private String username;

    @Size(min = 3, message = "비밀번호는 최소 3자 이상이어야 합니다.")
    private String password;

    @Size(min = 2, max = 20, message = "이름은 최소 2자 이상 최대 20자까지 입력 부탁드립니다.")
    private String nickname;

    @Pattern(regexp="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])+[.][a-zA-Z]{2,3}$", message="잘못된 이메일 형식입니다.")
    private String email;

    @Size(min = 1, max = 1, message = "남성은 M, 여성은 F로 입력 부탁드립니다.")
    private String gender;

    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private Date birthdate;

    @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "휴대폰 번호 형식에 맞지 않습니다.")
    private String tel;

    @Size(min = 3, max = 50, message = "주소는 최소 3자 이상 최대 20자까지 입력 부탁드립니다.")
    private String address;

    private Timestamp created_at;

    private Timestamp updated_at;

    private String isdelete;
}