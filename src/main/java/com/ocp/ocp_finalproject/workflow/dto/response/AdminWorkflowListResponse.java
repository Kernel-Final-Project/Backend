package com.ocp.ocp_finalproject.workflow.dto.response;

import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import com.ocp.ocp_finalproject.workflow.dto.SetTrendCategoryDto;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowStatus;
import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Builder
@RequiredArgsConstructor
@AllArgsConstructor
public class AdminWorkflowListResponse {

    private final Long workflowId;

    private final Long userId;

    private String siteName;

    private final String siteUrl;

    private final String trendCategoryName;

    private final String blogType;

    private final String blogAccountId;

    private final String blogUrl;

    private final String readableRule;

    private final WorkflowStatus status;

}
