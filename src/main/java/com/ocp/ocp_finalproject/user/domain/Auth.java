package com.ocp.ocp_finalproject.user.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.user.enums.AuthProvider;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "auth")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Auth extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "auth_id", nullable = false)
    private Long authId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id", nullable = false)
    private User user;

    @Enumerated(EnumType.STRING)
    @Column(name = "provider", length = 20)
    private AuthProvider provider;

    @Column(name = "provider_user_id", length = 100)
    private String providerUserId;

    @Column(name = "refresh_token", length = 500)
    private String refreshToken;

    @Column(name = "access_token", length = 500)
    private String accessToken;

    @Column(name = "last_login_at")
    private LocalDateTime lastLoginAt;

    @Builder(builderMethodName = "createBuilder")
    public static Auth create(User user, AuthProvider provider, String providerUserId, String refreshToken, String accessToken) {
        Auth auth = new Auth();
        auth.user = user;
        auth.provider = provider;
        auth.providerUserId = providerUserId;
        auth.refreshToken = refreshToken;
        auth.accessToken = accessToken;
        return auth;
    }

    // === 비즈니스 메서드 ===
    /**
     * 토큰 갱신
     */
    public void updateTokens(String accessToken, String refreshToken) {
        this.accessToken = accessToken;
        this.refreshToken = refreshToken;
    }

    /**
     * 로그인 시간 기록
     */
    public void recordLogin() {
        this.lastLoginAt = LocalDateTime.now();
    }

    /**
     * 토큰 초기화 (로그아웃)
     */
    public void clearTokens() {
        this.accessToken = null;
        this.refreshToken = null;
    }

    // === 조회 메서드 ===
    /**
     * 토큰 존재 여부
     */
    public boolean hasTokens() {
        return accessToken != null && refreshToken != null;
    }

    /**
     * 리프레시 토큰 존재 여부
     */
    public boolean hasRefreshToken() {
        return refreshToken != null;
    }
}
