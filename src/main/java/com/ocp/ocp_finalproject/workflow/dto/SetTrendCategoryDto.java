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

    public static SetTrendCategoryDto from(TrendCategory category) {

        TrendCategory d2 = category.getParentCategory();
        TrendCategory d1 = (d2 != null) ? d2.getParentCategory() : null;

        return SetTrendCategoryDto.builder()
                .depth1Category(d1 != null ? d1.getTrendCategoryName() : null)
                .depth2Category(d2 != null ? d2.getTrendCategoryName() : null)
                .depth3Category(category.getTrendCategoryName())
                .build();
    }

}