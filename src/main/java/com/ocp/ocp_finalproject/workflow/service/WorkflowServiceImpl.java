package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.workflow.dto.WorkflowResponse;
import com.ocp.ocp_finalproject.workflow.finder.WorkflowFinder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WorkflowServiceImpl implements WorkflowService {

    private final WorkflowFinder workflowFinder;

    @Override
    public List<WorkflowResponse> findWorkflows(Long userId) {

        return workflowFinder.findWorkflows(userId);
    }
}
