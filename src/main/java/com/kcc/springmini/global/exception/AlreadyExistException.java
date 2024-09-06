package com.kcc.springmini.global.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class AlreadyExistException extends RuntimeException{
    private HttpStatus code;

    public AlreadyExistException(String message) {
        super(message);
        this.code = HttpStatus.CONFLICT;
    }
}
