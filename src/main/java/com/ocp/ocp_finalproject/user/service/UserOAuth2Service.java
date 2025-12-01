package com.ocp.ocp_finalproject.user.service;

import com.ocp.ocp_finalproject.user.domain.Auth;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.enums.AuthProvider;
import com.ocp.ocp_finalproject.user.repository.AuthRepository;
import com.ocp.ocp_finalproject.user.repository.UserRepository;
import com.ocp.ocp_finalproject.user.service.oauth2.OAuth2UserInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * OAuth2 사용자 비즈니스 로직
 * 사용자 생성 / 업데이트 처리
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserOAuth2Service {
    private final UserRepository userRepository;
    private final AuthRepository authRepository;

    /**
     * OAuth2 사용자 처리 (신규 가입 OR 로그인)
     */
    @Transactional
    public User processOAuth2User(AuthProvider provider, OAuth2UserInfo userInfo) {
        String providerUserId = userInfo.getProviderId();
        String email = userInfo.getEmail();
        String name = userInfo.getName();

        log.info("OAuth2 사용자 처리 - Provider: {}, Email: {}", provider, email);

        return authRepository.findByProviderAndProviderUserId(provider, providerUserId)
                .map(auth -> updateExistingUser(auth))
                .orElseGet(()->createNewUser(provider, providerUserId, email, name));
    }

    /**
     * 기존 사용자 업데이트
     */
    private User updateExistingUser(Auth auth){
        auth.recordLogin();
        log.info("기존 사용자 로그인 -UserId: {}",auth.getUser().getId());
        return auth.getUser();
    }

    /**
     * 신규 사용자 생성
     */
    private User createNewUser(AuthProvider provider, String providerUserId, String email, String name){
        log.info("신규 사용자 가입 - provider: {}, email: {}", provider, email);

        // User 생성
        User user = User.create(name, email);
        userRepository.save(user);

        // Auth 생성
        Auth auth = Auth.create(user, provider, providerUserId);
        authRepository.save(auth);

        log.info("신규 사용자 가입 완료 - UserId: {}", user.getId());
        return user;
    }
}
