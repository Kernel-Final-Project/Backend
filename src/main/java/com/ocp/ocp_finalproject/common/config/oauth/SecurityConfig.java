package com.ocp.ocp_finalproject.common.config.oauth;

import com.ocp.ocp_finalproject.user.handler.OAuth2FailureHandler;
import com.ocp.ocp_finalproject.user.handler.OAuth2SuccessHandler;
import com.ocp.ocp_finalproject.user.service.CustomOAuth2UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

/**
 * Spring Security 설정
 * - 세션 기반 인증
 * - OAuth2 소셜 로그인
 * - CORS 설정
 */
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;
    private final OAuth2SuccessHandler oAuth2SuccessHandler;
    private final OAuth2FailureHandler oAuth2FailureHandler;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // ========== CSRF 설정 ==========
                // 개발 단계: disable (프론트엔드 분리 시)
                // 운영 단계: CookieCsrfTokenRepository 사용 권장
                .csrf(AbstractHttpConfigurer::disable)

                // ========== CORS 설정 ==========
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))

                // ========== 세션 관리 ==========
                .sessionManagement(session -> session
                        // IF_REQUIRED: 필요 시 세션 생성 (OAuth2 로그인 시 자동 생성)
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)

                        // 동시 로그인 세션 제한 (같은 계정으로 1개만 로그인 가능)
                        .maximumSessions(1)

                        // 새로운 로그인 시 기존 세션 만료
                        .maxSessionsPreventsLogin(false)

                        // 세션 만료 시 리다이렉트 URL
                        .expiredUrl("/login?expired")
                )

                // 세션 고정 공격 방지 (로그인 시 새 세션 ID 발급)
                .sessionManagement(session -> session
                        .sessionFixation().changeSessionId()
                )

                // ========== 인증/인가 설정 ==========
                .authorizeHttpRequests(auth -> auth
                        // OAuth2 로그인 관련 경로: 모두 허용
                        .requestMatchers(
                                "/oauth2/**",
                                "/login/oauth2/**"
                        ).permitAll()

                        // 인증이 필요한 API
                        .requestMatchers(
                                "/api/v1/auth/me",
                                "/api/v1/auth/logout"
                        ).authenticated()

                        // 나머지는 모두 허용 (개발 단계)
                        // 운영 단계에서는 .authenticated()로 변경 권장
                        .anyRequest().permitAll()
                )

                // ========== OAuth2 로그인 설정 ==========
                .oauth2Login(oauth2 -> oauth2
                        // 로그인 페이지 없음 (자동으로 /oauth2/authorization/{provider}로 리다이렉트)

                        // 성공 핸들러 (프론트엔드로 리다이렉트)
                        .successHandler(oAuth2SuccessHandler)

                        // 실패 핸들러 (에러 페이지로 리다이렉트)
                        .failureHandler(oAuth2FailureHandler)

                        // 사용자 정보 처리 서비스
                        .userInfoEndpoint(userInfo -> userInfo
                                .userService(customOAuth2UserService)
                        )
                )

                // ========== 예외 처리 ==========
                .exceptionHandling(exception -> exception
                        // 인증 실패 시 (401)
                        .authenticationEntryPoint((request, response, authException) -> {
                            response.setStatus(401);
                            response.setContentType("application/json;charset=UTF-8");
                            response.getWriter().write(
                                    "{\"success\":false,\"message\":\"인증이 필요합니다\"}"
                            );
                        })

                        // 권한 없음 시 (403)
                        .accessDeniedHandler((request, response, accessDeniedException) -> {
                            response.setStatus(403);
                            response.setContentType("application/json;charset=UTF-8");
                            response.getWriter().write(
                                    "{\"success\":false,\"message\":\"접근 권한이 없습니다\"}"
                            );
                        })
                );

        return http.build();
    }

    /**
     * CORS 설정
     * - 프론트엔드와 백엔드가 다른 포트에서 실행될 때 필요
     * - 세션 쿠키 전송을 위해 allowCredentials(true) 필수!
     */

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();

        // 허용할 Origin (프론트엔드 URL)
        configuration.setAllowedOrigins(List.of(
                "http://localhost:3000",      // React 개발 서버
                "http://localhost:8080"       // 백엔드 (테스트용)
        ));

        // 허용할 HTTP 메서드
        configuration.setAllowedMethods(List.of(
                "GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"
        ));

        // 허용할 헤더
        configuration.setAllowedHeaders(List.of("*"));

        // 인증 정보 포함 허용 (세션 쿠키 전송 필수!)
        configuration.setAllowCredentials(true);

        // 노출할 헤더
        configuration.setExposedHeaders(List.of(
                "Authorization", "Set-Cookie"
        ));

        // preflight 요청 캐시 시간 (1시간)
        configuration.setMaxAge(3600L);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);

        return source;
    }
}
