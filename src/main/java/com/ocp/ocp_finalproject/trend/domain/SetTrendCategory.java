package com.ocp.ocp_finalproject.trend.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "set_trend_category")
public class SetTrendCategory extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "depth1category")
    private Integer depth1Category;

    @Column(name = "depth2category")
    private Integer depth2Category;

    @Column(name = "depth3category")
    private Integer depth3Category;

    @Builder(builderMethodName = "createBuilder")
    public static SetTrendCategory create(Long setTrendKeywordId, Integer depth1Category, Integer depth2Category, Integer depth3Category) {
        SetTrendCategory setTrendCategory = new SetTrendCategory();
        setTrendCategory.id = setTrendKeywordId;
        setTrendCategory.depth1Category = depth1Category;
        setTrendCategory.depth2Category = depth2Category;
        setTrendCategory.depth3Category = depth3Category;
        return setTrendCategory;
    }

    public void updateDepths(Integer depth1Category, Integer depth2Category, Integer depth3Category) {
        this.depth1Category = depth1Category;
        this.depth2Category = depth2Category;
        this.depth3Category = depth3Category;
    }
}
