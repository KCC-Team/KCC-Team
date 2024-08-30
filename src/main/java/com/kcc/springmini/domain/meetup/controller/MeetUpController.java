package com.kcc.springmini.domain.meetup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meetup")
public class MeetUpController {

    @GetMapping("/meetupRegister")
    public String meetupRegister() {
        return "meetup/meetupRegister";
    }

   @GetMapping("/meetupDetail")
   public String meetupDetail() {
       return "meetup/meetupDetail";
   }

   @GetMapping("/postDetail")
   public String postDetail() {
       return "meetup/postDetail";
   }

}
