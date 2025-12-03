package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.workflow.dto.request.*;
import com.ocp.ocp_finalproject.workflow.dto.response.*;
import org.quartz.SchedulerException;

import java.util.List;

public interface WorkflowService {

    List<WorkflowListResponse> findWorkflows(Long userId);

    WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest) throws SchedulerException;

    WorkflowEditResponse findWorkflow(Long workflowId, Long userId);

    WorkflowResponse updateWorkflow(Long userId, WorkflowEditRequest workflowEditRequest) throws SchedulerException;
}