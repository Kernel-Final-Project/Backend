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
@Table(name = "set_trend_category")
public class SetTrendCategory extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "set_trend_category_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "depth1_category_id")
    private TrendCategory depth1Category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "depth2_category_id")
    private TrendCategory depth2Category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "depth3_category_id")
    private TrendCategory depth3Category;

    @Builder(builderMethodName = "createBuilder")
    public static SetTrendCategory create(TrendCategory depth1Category, TrendCategory depth2Category, TrendCategory depth3Category) {
        SetTrendCategory setTrendCategory = new SetTrendCategory();
        setTrendCategory.depth1Category = depth1Category;
        setTrendCategory.depth2Category = depth2Category;
        setTrendCategory.depth3Category = depth3Category;
        return setTrendCategory;
    }

    public void updateDepths(TrendCategory depth1Category, TrendCategory depth2Category, TrendCategory depth3Category) {
        this.depth1Category = depth1Category;
        this.depth2Category = depth2Category;
        this.depth3Category = depth3Category;
    }
}