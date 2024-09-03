package com.kcc.springmini.domain.schedule.controller;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.PageResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;
import com.kcc.springmini.domain.schedule.service.ScheduleService;
import com.kcc.springmini.global.aop.LoginValid;
import com.kcc.springmini.global.auth.PrincipalDetail;
import com.kcc.springmini.global.exception.ForbiddenException;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Objects;

import static org.springframework.http.HttpStatus.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/schedules")
public class ScheduleController {
    private final ScheduleService scheduleService;

    @LoginValid
    @PostMapping
    public String create(@AuthenticationPrincipal PrincipalDetail principalDetail,
            @RequestParam(value = "meetupId") Long meetupId, @ModelAttribute @Valid ScheduleVO scheduleVO) {
        scheduleService.save(principalDetail.getMember(), meetupId, scheduleVO);
        return "redirect:/meetups/" + meetupId;
    }

    @LoginValid
    @PostMapping("/{id}/participate")
    public ResponseEntity<String> participate(
            @RequestParam(value = "meetupId") Long meetupId,
            @PathVariable(value = "id") Long id,
            @AuthenticationPrincipal PrincipalDetail principalDetail) {
        scheduleService.participateSchedule(meetupId, id, principalDetail.getMember().getMemberId()
        );
        return ResponseEntity.ok().body("일정 참여가 완료되었습니다.");
    }

    // ajax delete 미지원
    @LoginValid
    @PostMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable(value = "id") Long id, @AuthenticationPrincipal PrincipalDetail principalDetail) throws IOException {
        if (!Objects.equals(scheduleService.findById(id).getMemberId(), principalDetail.getMember().getMemberId())) {
            throw new ForbiddenException("해당 일정을 삭제할 권한이 없습니다.", FORBIDDEN);
        }

        scheduleService.delete(id, principalDetail.getMember().getMemberId());
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<ScheduleResponseDto> findById(@PathVariable(value = "id") Long id) {
        return ResponseEntity.ok().body(scheduleService.findById(id));
    }

    @GetMapping
    @ResponseBody
    public ResponseEntity<PageResponseDto> findAll(
            @RequestParam(value = "meetupId") Long meetupId,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        return ResponseEntity.ok().body(scheduleService.findAll(meetupId, page));
    }
}
