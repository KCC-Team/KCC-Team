package com.kcc.springmini.global.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class ForbiddenException extends RuntimeException {
    private HttpStatus code;

    public ForbiddenException(String message) {
        super(message);
        this.code = HttpStatus.FORBIDDEN;
    }
}
