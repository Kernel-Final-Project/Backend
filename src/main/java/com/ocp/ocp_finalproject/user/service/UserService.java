package com.ocp.ocp_finalproject.user.service;

import com.ocp.ocp_finalproject.user.domain.Auth;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.enums.AuthProvider;
import com.ocp.ocp_finalproject.user.repository.AuthRepository;
import com.ocp.ocp_finalproject.user.repository.UserRepository;
import com.ocp.ocp_finalproject.user.service.oauth2.OAuth2UserInfo;
import com.ocp.ocp_finalproject.user.service.oauth2.OAuth2UserInfoFactory;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 사용자 조회 서비스
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final AuthRepository authRepository;

    /**
     * User Id로 조회
     */
    @Transactional(readOnly = true)
    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElseThrow(()-> new IllegalArgumentException("사용자를 찾을 수 없습니다. userId: " + userId));
    }

    /**
     * email로 조회
     */
    @Transactional(readOnly = true)
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElseThrow(()-> new IllegalArgumentException("사용자를 찾을 수 없습니다. email: " + email));
    }

    /**
     * 현재 로그인한 사용자 조회
     * - OAuth2UserInfoFactory 재사용!
     *
     * @param authentication Spring Security Authentication 객체
     * @return User 엔티티
     */
    public User getCurrentUser(Authentication authentication) {
        if (authentication == null || !(authentication instanceof OAuth2AuthenticationToken)) {
            throw new IllegalArgumentException("OAuth2 로그인 정보가 없습니다");
        }

        // 1. OAuth2AuthenticationToken으로 캐스팅
        OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;
        OAuth2User oAuth2User = oauthToken.getPrincipal();

        // 2. Provider 정보 추출
        String registrationId = oauthToken.getAuthorizedClientRegistrationId();
        AuthProvider provider = AuthProvider.valueOf(registrationId.toUpperCase());

        // 3. OAuth2UserInfoFactory 사용 (기존 로직 재사용!)
        OAuth2UserInfo userInfo = OAuth2UserInfoFactory.getOAuth2UserInfo(
                provider,
                oAuth2User.getAttributes()
        );

        // 4. 이메일 추출 (Factory가 알아서 처리)
        String providerUserId = userInfo.getProviderId();

        log.info("현재 사용자 조회 - provider: {}, email: {}", provider, providerUserId);

        // 5. DB 조회 (트랜잭션 시작)
        Auth auth = authRepository.findByProviderAndProviderUserId(provider, providerUserId)
                .orElseThrow(()-> new IllegalArgumentException("정보를 찾을 수 없습니다."));

        return auth.getUser();
    }
}
