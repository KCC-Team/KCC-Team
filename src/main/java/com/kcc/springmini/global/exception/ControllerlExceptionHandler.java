package com.kcc.springmini.global.exception;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Order(1) // 더 높은 우선순위
public class ControllerlExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ModelAndView handleMethodArgumentNotValid(MethodArgumentNotValidException e, HttpServletRequest request, Model model) {
        Map<String, String> messages = new HashMap<>();
        for (FieldError fieldError : e.getBindingResult().getFieldErrors()) {
            messages.put(fieldError.getField(), fieldError.getDefaultMessage());
        }

        // 유효성 검사를 통과하지 못한 원래 객체를 다시 가져옴
        Object target = e.getBindingResult().getTarget();

        // 요청 URL에 따라 뷰 이름을 동적으로 결정
        String viewName = determineViewName(request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(viewName);
        modelAndView.addObject("member", target); // 폼 데이터를 다시 전달
        modelAndView.addObject("messages", messages);
        modelAndView.addObject("status", HttpStatus.BAD_REQUEST.value());
        modelAndView.addObject("timestamp", LocalDateTime.now().toString());

        return modelAndView;
    }

    @ExceptionHandler(NotFoundToErrorException.class)
    public String handleNotFoundToErrorException(NotFoundToErrorException e) {
        return "404";
    }

    // 요청 URL에 따라 뷰 이름을 결정하는 메서드
    private String determineViewName(String requestURI) {
        System.out.println("requestURI = " + requestURI);
        if (requestURI.contains("/members/save")) {
            return "/member/joinForm";  // 회원가입 폼
        } else {
            return "404"; // 기본 에러 페이지
        }
    }
}
