package com.kcc.springmini.domain.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @GetMapping("/joinForm")
    public String joinForm() {
        return "member/joinForm";
    }

    @GetMapping("/mypage")
    public String mypage() {
        return "member/mypage";
    }

}
