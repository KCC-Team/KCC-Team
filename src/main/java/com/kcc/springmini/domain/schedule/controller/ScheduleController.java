package com.kcc.springmini.domain.schedule.controller;

import com.kcc.springmini.domain.schedule.model.Schedule;
import com.kcc.springmini.domain.schedule.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/{meetupId}/schedules")
public class ScheduleController {
    private final ScheduleService scheduleService;

    @GetMapping
    public List<Schedule> findAll() {
        return scheduleService.findAll();
    }


}
