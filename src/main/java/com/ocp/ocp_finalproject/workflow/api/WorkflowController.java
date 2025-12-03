package com.ocp.ocp_finalproject.workflow.api;

import com.ocp.ocp_finalproject.common.response.ApiResponse;
import com.ocp.ocp_finalproject.workflow.dto.request.*;
import com.ocp.ocp_finalproject.workflow.dto.response.*;
import com.ocp.ocp_finalproject.workflow.service.WorkflowService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/workflow")
@RequiredArgsConstructor
@Slf4j
public class WorkflowController {

    private final WorkflowService workflowService;

    /**
     * 워크플로우 목록 조회
     */
    @GetMapping("/{userId}")
    public ResponseEntity<ApiResponse<List<WorkflowListResponse>>> findWorkflows(@PathVariable Long userId) {

        List<WorkflowListResponse> workflowList = workflowService.findWorkflows(userId);

        return ResponseEntity.ok(ApiResponse.success("워크플로우 목록 조회 성공", workflowList));
    }

    /**
     * 워크플로우 상세 조회
     */
    @GetMapping("/{userId}/{workflowId}")
    public ResponseEntity<ApiResponse<WorkflowEditResponse>> getWorkflowEdit(@PathVariable Long userId,
                                                                             @PathVariable Long workflowId) {

        WorkflowEditResponse workflow = workflowService.findWorkflow(workflowId, userId);

        return ResponseEntity.ok(ApiResponse.success("워크플로우 상세 조회 성공", workflow));
    }

    /**
     * 워크플로우 등록
     */
    @PostMapping("/{userId}")
    public ResponseEntity<ApiResponse<WorkflowResponse>> createWorkflow(@PathVariable Long userId,
                                                                        @RequestBody WorkflowRequest workflowRequest) throws SchedulerException {

        WorkflowResponse workflow = workflowService.createWorkflow(userId, workflowRequest);

        return ResponseEntity.ok(ApiResponse.success("워크플로우 생성 성공", workflow));
    }

    /**
     * 워크플로우 수정
     * url, 트렌드 키워드, 블로그, 예약 시간, 블로그 계정 모두 수정 가능
     */
    @PutMapping("/{userId}/{workflowId}")
    public ResponseEntity<ApiResponse<WorkflowResponse>> updateWorkflow(@PathVariable Long userId,
                                                                        @PathVariable Long workflowId,
                                                                        @RequestBody WorkflowRequest workflowRequest) throws SchedulerException {
        WorkflowResponse workflow = workflowService.updateWorkflow(userId, workflowId, workflowRequest);

        return ResponseEntity.ok(ApiResponse.success("워크플로우 수정 성공", workflow));
    }

    /**
     * 워크플로우 상태 변경
     */
    @PatchMapping("/{userId}/{workflowId}/status")
    public ResponseEntity<ApiResponse<WorkflowStatusResponse>> updateStatus(@PathVariable Long userId,
                                                                      @PathVariable Long workflowId,
                                                                      @RequestBody WorkflowStatusRequest workflowStatusRequest) {

        WorkflowStatusResponse workflowStatus = workflowService.updateStatus(userId, workflowId, workflowStatusRequest.getStatus());

        return ResponseEntity.ok(ApiResponse.success("워크플로우 상태 변경 성공", workflowStatus));
    }

}