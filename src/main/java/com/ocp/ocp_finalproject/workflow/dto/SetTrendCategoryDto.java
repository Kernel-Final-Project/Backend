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

    private Long depth1Category;

    private Long depth2Category;

    private Long depth3Category;

    public static SetTrendCategoryDto from(TrendCategory category) {

        TrendCategory d2 = category.getParentCategory();
        TrendCategory d1 = (d2 != null) ? d2.getParentCategory() : null;

        return SetTrendCategoryDto.builder()
                .depth1Category(d1 != null ? d1.getId() : null)
                .depth2Category(d2 != null ? d2.getId() : null)
                .depth3Category(category.getId())
                .build();
    }

}