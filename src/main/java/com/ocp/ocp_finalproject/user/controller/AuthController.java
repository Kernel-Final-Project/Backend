package com.ocp.ocp_finalproject.user.controller;

import com.ocp.ocp_finalproject.common.response.ApiResponse;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.dto.response.UserResponse;
import com.ocp.ocp_finalproject.user.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 세션기반 인증
 * OAuth 소셜로그인
 */
@Slf4j
@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    /**
     * 현재 로그인한 사용자 정보 조회
     * GET /api/v1/auth/me
     */
    @GetMapping("/me")
    public ApiResponse<UserResponse> getCurrentUser(Authentication authentication) {
        log.info("현재 사용자 정보 조회 요청");

        User user = userService.getCurrentUser(authentication);

        UserResponse response = UserResponse.from(user);

        log.info("사용자 정보 조회 성공 - userId: {}",user.getId());
        return ApiResponse.success("사용자 상세 조회 성공",response);
    }

    /**
     * 로그 아웃
     * POST /api/vi/auth/logout
     */
    @PostMapping("/logout")
    public ApiResponse<Void> logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if(session != null) {
            session.invalidate();
        }

        return ApiResponse.success("로그아웃 성공");
    }
}
