package com.kcc.springmini.global.aop;

import com.kcc.springmini.global.exception.UnAuthorizedException;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoginAspect {

    @Before("@annotation(LoginValid)")
    public void checkLogin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication.getPrincipal().equals("anonymousUser")) {
            throw new UnAuthorizedException("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
        }
    }
}
