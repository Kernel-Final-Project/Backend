package com.ocp.ocp_finalproject.workflow.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class WorkflowEditResponse {

    private Long workflowId;

    private Long userId;

    private String siteUrl;

    private Long blogTypeId;

    private String blogUrl;

    private SetTrendCategoryDto setTrendCategory;

    private String blogAccountId;

    private RecurrenceRuleDto recurrenceRule;
}
