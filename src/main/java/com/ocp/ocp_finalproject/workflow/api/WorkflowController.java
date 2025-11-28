package com.ocp.ocp_finalproject.workflow.api;


import com.ocp.ocp_finalproject.common.response.ApiResponse;
import com.ocp.ocp_finalproject.workflow.dto.WorkflowResponse;
import com.ocp.ocp_finalproject.workflow.service.WorkflowService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/workflow")
@RequiredArgsConstructor
public class WorkflowController {

    private final WorkflowService workflowService;

    /**
     * 워크플로우 목록 조회
     */
    @GetMapping("/{userId}")
    public ApiResponse<List<WorkflowResponse>> findWorkflows(@PathVariable Long userId) {

        List<WorkflowResponse> workflowList = workflowService.findWorkflows(userId);

        return ApiResponse.success("워크플로우 목록 조회 성공", workflowList);
    }

}

