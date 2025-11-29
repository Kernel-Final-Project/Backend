package com.ocp.ocp_finalproject.user.repository;

import com.ocp.ocp_finalproject.user.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    /**
     * 이메일로 사용자 조회
     * OAuth 로그인 시 기존 회원 확인용
     */
    Optional<User> findByEmail(String email);
}
