package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.workflow.dto.WorkflowResponse;

import java.util.List;

public interface WorkflowService {

    List<WorkflowResponse> findWorkflows(Long userId);

}