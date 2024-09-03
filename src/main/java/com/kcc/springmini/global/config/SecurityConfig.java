package com.kcc.springmini.global.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;

import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public BCryptPasswordEncoder encodePwd() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf
                .ignoringRequestMatchers("/**") // 모든 경로에 대해 기본적으로 CSRF 비활성화
                .requireCsrfProtectionMatcher(request -> {
                    String uri = request.getRequestURI();

                    // 로그인, 회원가입 페이지에서만 CSRF 활성화
                    return uri.equals("/members/loginForm") || uri.equals("/members/joinForm");
                })
        );
        http.authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/members/mypage").authenticated()
                                .requestMatchers("/meetups/register").authenticated()
                                .requestMatchers("/posts/**").authenticated()
                                .anyRequest().permitAll()
                ).formLogin(formLogin -> formLogin.loginPage("/members/loginForm") // 로그인 페이지 지정
                        .loginProcessingUrl("/login") // 컨트롤러 지정 없이 시큐리티에서 로그인 진행
                        .successHandler((request, response, authentication) -> {
                            String prevPage = (String) request.getSession().getAttribute("prevPage");
                            if (prevPage.contains("meetups")) {
                                response.sendRedirect(prevPage);
                            } else {
                                SavedRequestAwareAuthenticationSuccessHandler defaultHandler = new SavedRequestAwareAuthenticationSuccessHandler();
                                defaultHandler.onAuthenticationSuccess(request, response, authentication);
                            }
                        })
                        .failureHandler(authenticationFailureHandler())) // 로그인 실패 시 처리할 핸들러 설정
                .logout(logout -> logout
                        .logoutUrl("/logout") // 로그아웃 요청 경로
                        .logoutSuccessUrl("/") // 로그아웃 성공 시 이동할 경로
                        .invalidateHttpSession(true)
                )
                .headers(headers -> headers
                        .frameOptions(HeadersConfigurer.FrameOptionsConfig::sameOrigin)); // 보안 헤더 설정 추가

        return http.build();
    }

    @Bean
    public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowUrlEncodedDoubleSlash(true); // 이중 슬래시 허용
        return firewall;
    }

    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new SimpleUrlAuthenticationFailureHandler() {
            @Override
            public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, IOException {
                // 로그인 실패 시 메시지를 설정하고 리디렉션
                response.sendRedirect("/members/loginForm?error=true");
            }
        };
    }
}