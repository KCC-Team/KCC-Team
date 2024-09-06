package com.kcc.springmini.global.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class BadRequestException extends RuntimeException{
    private String message;
    private HttpStatus code;

    public BadRequestException(String message) {
        super(message);
        this.code = HttpStatus.BAD_REQUEST;
    }
}
