package com.kcc.springmini.domain.schedule.controller;

import com.kcc.springmini.domain.schedule.model.Schedule;
import com.kcc.springmini.domain.schedule.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/{meetupId}/schedules")
public class ScheduleController {
    private final ScheduleService scheduleService;

    @PostMapping
    public void create(@PathVariable(value = "meetupId") Long meetupId, @RequestBody Schedule schedule) {
        scheduleService.save(meetupId, schedule);
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
    public List<Schedule> findAll(
            @PathVariable(value = "meetupId") Long meetupId,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        return scheduleService.findAll(meetupId, page);
    }

}
