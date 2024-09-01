package com.kcc.springmini.domain.member.controller;

import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

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

    @GetMapping("/memberModify")
    public String memberModify() {
        return "member/memberModify";
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

        String rawPassword = member.getPassword();
        String encryptedPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setPassword(encryptedPassword);

        memberService.save(member);
        return "/main";
    }

    @PostMapping("/update")
    public String update(@Valid MemberVO member, RedirectAttributes rttr) {
        int updateCount = memberService.update(member);

        if (updateCount < 1) {
            rttr.addFlashAttribute("result", "updateFail");
            return "redirect:/members/mypage";
        }

        String rawPassword = member.getPassword();
        String encryptedPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setPassword(encryptedPassword);

        rttr.addFlashAttribute("result", "updateSuccess");

        return "redirect:/members/mypage";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("username") String username, HttpServletRequest request, RedirectAttributes rttr) {
        MemberVO member = memberService.findById(username);
        if (member == null) {
            rttr.addFlashAttribute("result", "deleteFail");
            return "redirect:/members/mypage";
        }

        int deleteCount = memberService.delete(username);
        if (deleteCount < 1) {
            rttr.addFlashAttribute("result", "deleteFail");
            return "redirect:/members/mypage";
        }

        SecurityContextHolder.clearContext();
        request.getSession().invalidate();
        rttr.addFlashAttribute("result", "deleteSuccess");

        return "redirect:/";
    }

}
