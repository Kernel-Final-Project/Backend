package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.workflow.dto.WorkflowEditResponse;
import com.ocp.ocp_finalproject.workflow.dto.WorkflowListResponse;
import com.ocp.ocp_finalproject.workflow.dto.WorkflowRequest;
import com.ocp.ocp_finalproject.workflow.dto.WorkflowResponse;
import org.quartz.SchedulerException;

import java.util.List;

public interface WorkflowService {

    List<WorkflowListResponse> findWorkflows(Long userId);

    WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest) throws SchedulerException;

    WorkflowEditResponse findWorkflow(Long workflowId, Long userId);
}