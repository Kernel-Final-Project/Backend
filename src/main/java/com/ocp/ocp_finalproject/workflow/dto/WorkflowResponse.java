package com.ocp.ocp_finalproject.workflow.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class WorkflowResponse {

    private Long workflowId;

    private Long userId;

    private String siteUrl;

    private String blogType;

    private String blogUrl;

    private String trendCategory;

    private SetTrendCategoryDto setTrendCategory;

    private String blogAccountId;

    private String readableRule;

}