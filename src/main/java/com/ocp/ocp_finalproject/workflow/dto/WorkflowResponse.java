package com.ocp.ocp_finalproject.workflow.dto;

import com.ocp.ocp_finalproject.workflow.enums.WorkflowStatus;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class WorkflowResponse {

    private final Long workflowId;

    private final Long userId;

    private final String siteUrl;

    private final String blogUrl;

    private final SetTrendCategoryDto setTrendCategory;

    private final String blogAccountId;

    private final String readableRule;

    private final WorkflowStatus status;

}