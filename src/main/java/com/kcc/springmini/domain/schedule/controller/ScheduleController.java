package com.kcc.springmini.domain.schedule.controller;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.PageResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;
import com.kcc.springmini.domain.schedule.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/meetups/{meetupId}/schedules")
public class ScheduleController {
    private final ScheduleService scheduleService;

    @GetMapping("/new")
    public String showCreateForm() {
        return "schedule/create";
    }

    @PostMapping
    public void create(@PathVariable(value = "meetupId") Long meetupId, @RequestBody ScheduleVO scheduleVO) {
        scheduleService.save(meetupId, scheduleVO);
    }

    @PostMapping("/{id}/participate")
    public String participate(
            @PathVariable(value = "meetupId") Long meetupId,
            @PathVariable(value = "id") Long id,
            @RequestParam(value = "member") Long memberId, Model model) {
        scheduleService.participateSchedule(meetupId, id, memberId);
        model.addAttribute("alert", "참여가 완료되었습니다.");
        return "redirect:/meetups/" + meetupId;
    }

    // ajax delete 미지원
    @PostMapping("/{id}")
    public String delete(@PathVariable(value = "meetupId") Long meetupId, @PathVariable(value = "id") Long id) {
        scheduleService.delete(id);
        return "redirect:/meetups/" + meetupId;
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<ScheduleResponseDto> findById(@PathVariable(value = "id") Long id) {
        return ResponseEntity.ok().body(scheduleService.findById(id));
    }

    @GetMapping
    @ResponseBody
    public ResponseEntity<PageResponseDto> findAll(
            @PathVariable(value = "meetupId") Long meetupId,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        return ResponseEntity.ok().body(scheduleService.findAll(meetupId, page));
    }
}
