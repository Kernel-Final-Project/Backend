package com.ocp.ocp_finalproject.user.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.user.enums.UserRole;
import com.ocp.ocp_finalproject.user.enums.UserStatus;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "user")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id", nullable = false)
    private Long id;

    @Column(name = "name", length = 50)
    private String name;

    @Column(name = "birth", length = 10)
    private String birth;

    @Column(name = "email", length = 100)
    private String email;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 50)
    private UserStatus status;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", length = 50)
    private UserRole role;

    @Builder(builderMethodName = "createBuilder")
    public static User create(String name, String birth, String email, UserStatus status, UserRole role) {
        User user = new User();
        user.name = name;
        user.birth = birth;
        user.email = email;
        user.status = status;
        user.role = role;
        return user;
    }

    // ================ 비즈니스 매서드 ================
    /**
     * 사용자 정보 수정
     */
    public void updateProfile(String name, String email){
        this.name = name;
        this.email = email;
    }

    /**
     * 계정 상태 변경
     */
    public void updateStatus(UserStatus status){
        this.status = status;
    }

    /**
     * 권한 변경
     */
    public void updateRole(UserRole role){
        this.role = role;
    }
}
