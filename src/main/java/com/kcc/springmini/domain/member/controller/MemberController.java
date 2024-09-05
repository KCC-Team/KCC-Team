package com.kcc.springmini.domain.member.controller;

import com.kcc.springmini.domain.meetup.service.MeetUpService;
import com.kcc.springmini.domain.member.model.dto.MemberQAResponseDto;
import com.kcc.springmini.domain.member.model.vo.MemberVO;
import com.kcc.springmini.domain.member.service.MemberService;
import com.kcc.springmini.global.auth.PrincipalDetail;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;
    private final MeetUpService meetUpService;
    
    @GetMapping("/loginForm")
    public String loginForm(HttpServletRequest request, Model model, @RequestParam(value = "loginDenied", required = false) String loginDenied) {
        if (loginDenied != null) {
            model.addAttribute("loginDenied", loginDenied);
        }

        String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("prevPage", referrer);
        return "member/loginForm";
    }

    @GetMapping("/joinForm")
    public String joinForm() {
        return "member/joinForm";
    }

//    @GetMapping("/mypage")
//    public String mypage(Principal principal, Model model) {
//       // String username = principal.getName();
//        String username = "test0"; //테스트용
//
//        model.addAttribute("meetupList", memberService.getMeetupList(username));
//        model.addAttribute("scheduleList", memberService.getScheduleList(username));
//        return "member/mypage";
//    }
    
//    @GetMapping("/mypage")
//    public String mypage(Principal principal, Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
//       // String username = principal.getName();
//        String username = "test0"; //테스트용
// 
    @GetMapping("/mypage")
    public String mypage(Principal principal,@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {
       String username = principal.getName();
        model.addAttribute("meetupList", memberService.getMeetupList(username));
        model.addAttribute("scheduleList", memberService.getScheduleList(username));
        
        Long memberId = principalDetail.getMember().getMemberId();
        List<Long> meetupIds = meetUpService.selectMeetUpId(memberId);
        
        List<MemberQAResponseDto> qas = new ArrayList<>();
        
        for(Long meetupId : meetupIds) {
        	qas.add(meetUpService.findMemberQA(meetupId));
        }
        
        System.out.println(qas);   
        model.addAttribute("answers", qas);
       
        return "member/mypage";
    }

    @GetMapping("/memberModify")
    public String memberModify(Principal principal, Model model) {
        String username = principal.getName();
        MemberVO member = memberService.findById(username);

        // 날짜 형식을 지정
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date birthdate = member.getBirthdate();
        if (birthdate != null) {
            String formattedBirthdate = formatter.format(birthdate);
            model.addAttribute("formattedBirthdate", formattedBirthdate);
        }
        model.addAttribute("list", member);
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
    public String save(@Valid MemberVO member,
                       @RequestPart(value = "file", required=false) MultipartFile file) {
        if (member == null) {
            return "redirect:/loginForm";
        }
        memberService.save(member, file);
        return "redirect:/";
    }

    @PostMapping("/update")
    public String update(@Valid MemberVO member, RedirectAttributes rttr) {
        int updateCount = memberService.update(member);
        if (updateCount < 1) {
            rttr.addFlashAttribute("result", "updateFail");
            return "redirect:/members/mypage";
        }
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
