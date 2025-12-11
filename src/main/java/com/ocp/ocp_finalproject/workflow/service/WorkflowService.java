package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.workflow.dto.request.*;
import com.ocp.ocp_finalproject.workflow.dto.response.*;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowStatus;
import org.quartz.SchedulerException;
import org.springframework.data.domain.Page;

import java.util.List;

public interface WorkflowService {

    Page<WorkflowListResponse> getWorkflows(Long userId, int page);

    WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest) throws SchedulerException;

    WorkflowEditResponse getWorkflow(Long workflowId, Long userId);

    WorkflowResponse updateWorkflow(Long userId, Long workflowId, WorkflowRequest workflowRequest) throws SchedulerException;

    WorkflowStatusResponse updateStatus(Long userId, Long workflowId, WorkflowStatus status);

    WorkflowStatusResponse deleteWorkflow(Long userId, Long workflowId);

    List<TrendCategoryResponse> getTrendCategories();

    List<BlogTypeResponse> getBlogTypes();
}