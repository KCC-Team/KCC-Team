package com.kcc.springmini.global.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class NotFoundException extends RuntimeException {
    private HttpStatus code;

    public NotFoundException(String message) {
        super(message);
        this.code = HttpStatus.NOT_FOUND;
    }
}
