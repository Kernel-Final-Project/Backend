package com.ocp.ocp_finalproject.admin.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "common_code")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CommonCode extends BaseEntity {

    @Id
    @Column(name = "code_id", length = 50)
    private String id;

    @Column(name = "code_name", length = 100, nullable = false)
    private String codeName;

    @Column(length = 255)
    private String description;

    @Column(name = "sort_order")
    private Integer sortOrder;

    @Column(name = "is_active")
    private Boolean isActive;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id", nullable = false)
    private CommonCodeGroup commonCodeGroup;

    // 정적 팩토리 + Builder
    @Builder(builderMethodName = "createBuilder")
    public static CommonCode create(
            String codeId,
            CommonCodeGroup commonCodeGroup,
            String codeName,
            String description,
            Integer sortOrder,
            Boolean isActive
    ) {
        CommonCode code = new CommonCode();
        code.id = codeId;
        code.codeName = codeName;
        code.description = description;
        code.sortOrder = sortOrder;
        code.isActive = isActive;
        if (commonCodeGroup != null) {
            commonCodeGroup.addCode(code);  // 편의 메서드로 양방향 연결
        }
        return code;
    }

    // 편의 메서드: CommonCodeGroup과 양방향 안전하게 연결
    public void setCommonCodeGroup(CommonCodeGroup group) {
        this.commonCodeGroup = group;
        if (!group.getCommonCodes().contains(this)) {
            group.getCommonCodes().add(this);
        }
    }
}
