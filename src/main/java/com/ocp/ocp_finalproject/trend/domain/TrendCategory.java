package com.ocp.ocp_finalproject.trend.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "trend_category")
public class TrendCategory extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trend_category_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_category_id")
    private TrendCategory parentCategory;

    @Column(name = "trend_category_name", length = 100)
    private String name;

    @Column(name = "depth")
    private Integer depth;

    @Builder(builderMethodName = "createBuilder")
    public static TrendCategory create(TrendCategory parentCategory, String name, Integer depth) {
        TrendCategory trendCategory = new TrendCategory();
        trendCategory.parentCategory = parentCategory;
        trendCategory.name = name;
        trendCategory.depth = depth;
        return trendCategory;
    }

    public void updateInfo(String name, Integer depth, TrendCategory parentCategory) {
        this.name = name;
        this.depth = depth;
        this.parentCategory = parentCategory;
    }
}
