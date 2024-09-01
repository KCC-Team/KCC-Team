package com.kcc.springmini.domain.member.model.vo;

import jakarta.validation.constraints.Size;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO implements Serializable {
    private Long member_id;
    private Long memberId;

    @Size(min = 2, max = 20)
    private String username;

    @Size(min = 3, message = "비밀번호는 최소 3자 이상이어야 합니다.")
    private String password;

    @Size(min = 2, max = 20)
    private String nickname;

    @Size(min = 2, max = 30)
    private String email;

    private String gender;

    private Date birthdate;

    @Size(min = 2, max = 15)
    private String tel;

    @Size(min = 2, max = 50)
    private String address;

    private Timestamp created_at;

    private Timestamp updated_at;

    private String isdelete;
}