package com.kcc.springmini.global.exception;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Order(1) // 더 높은 우선순위
public class ControllerExceptionHandler {

    // NotFoundToErrorException 처리
    @ExceptionHandler(NotFoundToErrorException.class)
    public String handleNotFoundToErrorException(NotFoundToErrorException e) {
        return "404";
    }

    // MethodArgumentNotValidException 처리
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Object handleMethodArgumentNotValid(MethodArgumentNotValidException e, HttpServletRequest request) {
        Map<String, String> errors = new HashMap<>();
        e.getBindingResult().getFieldErrors().forEach(fieldError ->
                errors.put(fieldError.getField(), fieldError.getDefaultMessage())
        );

        // 요청의 Content-Type 확인
        String contentType = request.getContentType();

        if (contentType != null && contentType.contains("application/json")) {
            // JSON 요청일 경우 JSON 형식으로 응답
            Map<String, Object> response = new HashMap<>();
            response.put("errors", errors);
            response.put("status", HttpStatus.BAD_REQUEST.value());
            response.put("timestamp", LocalDateTime.now());

            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        } else {
            // 일반 Form 요청일 경우
            Object target = e.getBindingResult().getTarget();  // 원래의 객체를 다시 가져옴

            // 요청 URL에 따라 뷰 이름을 동적으로 결정
            String viewName = determineViewName(request.getRequestURI());

            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName(viewName);
            modelAndView.addObject("formObject", target);  // 폼 데이터를 다시 전달
            modelAndView.addObject("messages", errors);
            modelAndView.addObject("status", HttpStatus.BAD_REQUEST.value());
            modelAndView.addObject("timestamp", LocalDateTime.now().toString());

            return modelAndView;
        }
    }

    // 요청 URL에 따라 뷰 이름을 결정하는 메서드
    private String determineViewName(String requestURI) {
        if (requestURI.contains("/members/save")) {
            return "/member/joinForm";  // 회원가입 폼
        } else {
            return "404";  // 기본 에러 페이지
        }
    }
}
