package com.kcc.springmini.domain.schedule.controller;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.PageResponseDto;
import com.kcc.springmini.domain.schedule.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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

    @DeleteMapping("/{id}")
    public void delete(@PathVariable(value = "id") Long id) {
        scheduleService.delete(id);
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ScheduleVO findById(@PathVariable(value = "id") Long id) {
        return scheduleService.findById(id);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable(value = "id") Long id) {
        scheduleService.delete(id);
    }

    @GetMapping("/{id}")
    public Schedule findById(@PathVariable(value = "id") Long id) {
        return scheduleService.findById(id);
    }

    @GetMapping
    @ResponseBody
    public ResponseEntity<PageResponseDto> findAll(
            @PathVariable(value = "meetupId") Long meetupId,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        return ResponseEntity.ok().body(scheduleService.findAll(meetupId, page));
    }
}
