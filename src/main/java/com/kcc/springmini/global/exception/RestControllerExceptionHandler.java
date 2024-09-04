package com.kcc.springmini.global.exception;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Slf4j
public class RestControllerExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public ResponseEntity<ExceptionResponse> handleRuntimeException(HttpServletRequest request, RuntimeException e) {
        log.error("handleRuntimeException", e);
        ExceptionResponse exceptionResponse = new ExceptionResponse(
                request.getRequestURL().toString(),
                Map.of("error", "INTERNAL_SERVER_ERROR"),
                HttpStatus.INTERNAL_SERVER_ERROR, LocalDateTime.now().toString());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(exceptionResponse);
    }

    @ExceptionHandler({
            NotFoundException.class,
            BadRequestException.class,
            AlreadyExistException.class,
            ForbiddenException.class,
    })
    @ResponseBody
    public ResponseEntity<ExceptionResponse> handleException(HttpServletRequest request, NotFoundException e) {
        log.error("handleNotFoundException", e);
        ExceptionResponse exceptionResponse = new ExceptionResponse(
                request.getRequestURL().toString(),
                Map.of("error", e.getMessage()),
                e.getCode(), LocalDateTime.now().toString());
        return ResponseEntity.status(e.getCode()).body(exceptionResponse);
    }

    @ExceptionHandler(NotFoundToErrorException.class)
    public String handleNotFoundToErrorException(NotFoundToErrorException e) {
        log.error("handleNotFoundException", e);
        return "404";
    }

    @ExceptionHandler(UnAuthorizedException.class)
    @ResponseBody
    public void handleUnauthenticatedAccessException(HttpServletResponse response) throws IOException {
        String errorMessage = "로그인이 필요합니다.";
        String encodedErrorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
        response.sendRedirect("/members/loginForm?loginDenied=" + encodedErrorMessage);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @Order(1)
    public String handleMethodArgumentNotValid(MethodArgumentNotValidException e, HttpServletRequest request, Model model) {
        Map<String, String> messages = new HashMap<>();
        for (FieldError fieldError : e.getBindingResult().getFieldErrors()) {
            messages.put(fieldError.getField(), fieldError.getDefaultMessage());
        }
        ExceptionResponse response = null;
        response = new ExceptionResponse("", messages, HttpStatus.BAD_REQUEST, LocalDateTime.now().toString());

        return "redirect:" + request.getRequestURI();
    }
}
