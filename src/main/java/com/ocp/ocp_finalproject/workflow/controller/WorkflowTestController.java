package com.ocp.ocp_finalproject.workflow.controller;

import com.ocp.ocp_finalproject.common.response.ApiResult;
import com.ocp.ocp_finalproject.user.domain.UserPrincipal;
import com.ocp.ocp_finalproject.workflow.dto.request.WorkflowRequest;
import com.ocp.ocp_finalproject.workflow.dto.response.WorkflowTestResponse;
import com.ocp.ocp_finalproject.workflow.service.WorkflowTestService;
import lombok.RequiredArgsConstructor;
import org.quartz.SchedulerException;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/workflows")
@RequiredArgsConstructor
public class WorkflowTestController {

    private final WorkflowTestService workflowTestService;

    @PostMapping("/test")
    public ResponseEntity<ApiResult<WorkflowTestResponse>> executeWorkflowTest(
            @AuthenticationPrincipal UserPrincipal principal,
            @RequestBody WorkflowRequest workflowRequest
    ) throws SchedulerException {
        WorkflowTestResponse response = workflowTestService.executeWorkflowTest(principal, workflowRequest);

        return ResponseEntity.ok(
                ApiResult.success("워크플로우 생성 및 테스트 실행 완료", response)
        );
    }

}
