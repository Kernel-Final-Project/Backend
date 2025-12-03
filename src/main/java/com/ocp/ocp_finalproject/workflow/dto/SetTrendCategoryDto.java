package com.ocp.ocp_finalproject.workflow.dto;

import com.ocp.ocp_finalproject.trend.domain.TrendCategory;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
@AllArgsConstructor
public class SetTrendCategoryDto {

    private String depth1Category;

    private String depth2Category;

    private String depth3Category;

    public static SetTrendCategoryDto from(List<TrendCategory> path) {
        return SetTrendCategoryDto.builder()
                .depth1Category(!path.isEmpty() ? path.getFirst().getTrendCategoryName() : null)
                .depth2Category(path.size() > 1 ? path.get(1).getTrendCategoryName() : null)
                .depth3Category(path.size() > 2 ? path.get(2).getTrendCategoryName() : null)
                .build();
    }

}