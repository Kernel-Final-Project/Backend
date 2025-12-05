package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.workflow.dto.request.*;
import com.ocp.ocp_finalproject.workflow.dto.response.*;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowStatus;
import org.quartz.SchedulerException;

import java.util.List;

public interface WorkflowService {

    List<WorkflowListResponse> findWorkflows(Long userId);

    WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest) throws SchedulerException;

    WorkflowEditResponse findWorkflow(Long workflowId, Long userId);

    WorkflowResponse updateWorkflow(Long userId, Long workflowId, WorkflowRequest workflowRequest) throws SchedulerException;

    WorkflowStatusResponse updateStatus(Long userId, Long workflowId, WorkflowStatus status);

    WorkflowStatusResponse deleteWorkflow(Long userId, Long workflowId);

    List<TrendCategoryResponse> findTrendCategories();

    List<BlogTypeResponse> findBlogTypes();
}