package com.kcc.springmini.domain.meetup.controller;

import com.kcc.springmini.domain.schedule.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/meetups")
public class MeetUpController {
    private final ScheduleService scheduleService;

    @GetMapping("/meetupRegister")
    public String meetupRegister() {
        return "meetup/meetupRegister";
    }

   @GetMapping("/{meetupId}")
   public String meetupDetail(@PathVariable(value = "meetupId") Long meetupId, Model model) {
       return "meetup/meetupDetail";
   }

   @GetMapping("/postDetail")
   public String postDetail() {
       return "meetup/postDetail";
   }

}
