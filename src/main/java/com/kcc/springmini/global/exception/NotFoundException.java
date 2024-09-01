package com.kcc.springmini.global.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
@AllArgsConstructor
public class NotFoundException extends RuntimeException {
    private String message;
    private HttpStatus code;
}
