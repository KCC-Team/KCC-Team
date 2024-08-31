package com.kcc.springmini.domain.member.controller;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;

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

    @GetMapping("/{username}")
    @ResponseBody
    public MemberVO findMember(@PathVariable String username) {
        MemberVO member = memberService.findById(username);
        if (member == null) {
            return null;
        }
        return member;
    }

    @PostMapping("/save")
    public String save(@Valid MemberVO member) {
        if (member == null) {
            return "redirect:/loginForm";
        }
        memberService.save(member);
        log.info(member.toString());
        return "/main";
    }
}
