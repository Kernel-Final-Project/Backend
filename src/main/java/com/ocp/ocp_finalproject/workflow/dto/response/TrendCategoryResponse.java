package com.ocp.ocp_finalproject.workflow.dto.response;

import com.ocp.ocp_finalproject.trend.domain.TrendCategory;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
@AllArgsConstructor
public class TrendCategoryResponse {

    private Long trendCategoryId;

    private String trendCategoryName;

    private List<TrendCategoryResponse> childrenCategory;

    public static TrendCategoryResponse from(TrendCategory category) {
        return TrendCategoryResponse.builder()
                .trendCategoryId(category.getId())
                .trendCategoryName(category.getTrendCategoryName())
                .childrenCategory(category.getChildrenCategory()
                        .stream()
                        .map(TrendCategoryResponse::from) // 재귀 호출
                        .toList())
                .build();
    }

}