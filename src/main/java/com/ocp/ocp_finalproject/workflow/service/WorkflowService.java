package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.workflow.dto.request.*;
import com.ocp.ocp_finalproject.workflow.dto.response.*;

import java.util.List;

public interface WorkflowService {

    List<WorkflowListResponse> findWorkflows(Long userId);

    WorkflowEditResponse findWorkflow(Long workflowId, Long userId);

    WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest);

    WorkflowResponse updateWorkflow(Long userId, WorkflowEditRequest workflowEditRequest);
}