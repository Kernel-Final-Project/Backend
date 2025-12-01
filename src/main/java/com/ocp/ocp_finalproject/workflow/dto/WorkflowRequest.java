package com.ocp.ocp_finalproject.workflow.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class WorkflowRequest {

    private String siteUrl;

    private Long blogTypeId;

    private String blogUrl;

    private Long categoryId;

    private String blogAccountId;

    private String blogAccountPwd;

    private RecurrenceRuleDto recurrenceRule;
}