package com.ocp.ocp_finalproject.workflow.controller;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.response.ApiResult;
import com.ocp.ocp_finalproject.user.domain.UserPrincipal;
import com.ocp.ocp_finalproject.workflow.dto.request.*;
import com.ocp.ocp_finalproject.workflow.dto.response.*;
import com.ocp.ocp_finalproject.workflow.enums.SiteUrlInfo;
import com.ocp.ocp_finalproject.workflow.service.WorkflowService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.UNAUTHORIZED;

@RestController
@RequestMapping("/api/v1/workflow")
@RequiredArgsConstructor
@Slf4j
public class WorkflowController {

    private final WorkflowService workflowService;

    /**
     * 워크플로우 목록 조회
     */
    @GetMapping
    public ResponseEntity<ApiResult<Page<WorkflowListResponse>>> getWorkflows(
            @AuthenticationPrincipal UserPrincipal principal,
            @RequestParam(value = "page", defaultValue = "0") int page
    ) {

        Long userId = validateAndGetUserId(principal);

        Page<WorkflowListResponse> workflowList = workflowService.getWorkflows(userId, page);

        return ResponseEntity.ok(ApiResult.success("워크플로우 목록 조회 성공", workflowList));
    }

    /**
     * 워크플로우 상세 조회
     */
    @GetMapping("/{workflowId}")
    public ResponseEntity<ApiResult<WorkflowEditResponse>> getWorkflowEdit(
            @AuthenticationPrincipal UserPrincipal principal,
            @PathVariable Long workflowId
    ) {

        Long userId = validateAndGetUserId(principal);

        WorkflowEditResponse workflow = workflowService.getWorkflow(workflowId, userId);

        return ResponseEntity.ok(ApiResult.success("워크플로우 상세 조회 성공", workflow));
    }

    /**
     * 워크플로우 등록
     */
    @PostMapping
    public ResponseEntity<ApiResult<WorkflowResponse>> createWorkflow(
            @AuthenticationPrincipal UserPrincipal principal,
            @RequestBody WorkflowRequest workflowRequest
    ) throws SchedulerException {

        Long userId = validateAndGetUserId(principal);

        WorkflowResponse workflow = workflowService.createWorkflow(userId, workflowRequest);

        return ResponseEntity.ok(ApiResult.success("워크플로우 생성 성공", workflow));
    }

    /**
     * 워크플로우 수정
     * url, 트렌드 키워드, 블로그, 예약 시간, 블로그 계정 모두 수정 가능
     */
    @PutMapping("/{workflowId}")
    public ResponseEntity<ApiResult<WorkflowResponse>> updateWorkflow(
            @AuthenticationPrincipal UserPrincipal principal,
            @PathVariable Long workflowId,
            @RequestBody WorkflowRequest workflowRequest
    ) throws SchedulerException {

        Long userId = validateAndGetUserId(principal);

        WorkflowResponse workflow = workflowService.updateWorkflow(userId, workflowId, workflowRequest);

        return ResponseEntity.ok(ApiResult.success("워크플로우 수정 성공", workflow));
    }

    /**
     * 워크플로우 상태 변경
     */
    @PatchMapping("/{workflowId}/status")
    public ResponseEntity<ApiResult<WorkflowStatusResponse>> updateStatus(
            @AuthenticationPrincipal UserPrincipal principal,
            @PathVariable Long workflowId,
            @RequestBody WorkflowStatusRequest workflowStatusRequest
    ) {
        Long userId = validateAndGetUserId(principal);

        WorkflowStatusResponse workflowStatus = workflowService.updateStatus(userId, workflowId, workflowStatusRequest.getNewStatus());

        return ResponseEntity.ok(ApiResult.success("워크플로우 상태 변경 성공", workflowStatus));
    }

    /**
     * 워크플로우 삭제(논리 삭제)
     */
    @DeleteMapping("/{workflowId}")
    public ResponseEntity<ApiResult<WorkflowStatusResponse>> deleteWorkflow(
            @AuthenticationPrincipal UserPrincipal principal,
            @PathVariable Long workflowId
    ) {
        Long userId = validateAndGetUserId(principal);

        WorkflowStatusResponse workflowStatus = workflowService.deleteWorkflow(userId, workflowId);

        return ResponseEntity.ok(ApiResult.success("워크플로우 삭제 성공", workflowStatus));
    }

    /**
     * 트렌드 카테고리 조회(워크플로우 등록 페이지)
     */
    @GetMapping("/trend-category")
    public ResponseEntity<ApiResult<List<TrendCategoryResponse>>> getTrendCategories() {

        List<TrendCategoryResponse> trendCategories = workflowService.getTrendCategories();

        return ResponseEntity.ok(ApiResult.success("트렌드 카테고리 조회 성공", trendCategories));
    }

    /**
     * 블로그 타입 조회(워크플로우 등록 페이지)
     */
    @GetMapping("/blog-type")
    public ResponseEntity<ApiResult<List<BlogTypeResponse>>> getBlogTypes() {

        List<BlogTypeResponse> blogTypes = workflowService.getBlogTypes();

        return ResponseEntity.ok(ApiResult.success("블로그 타입 조회 성공", blogTypes));
    }

    private Long validateAndGetUserId(UserPrincipal principal) {
        if (principal == null || principal.getUser() == null) {
            throw new CustomException(UNAUTHORIZED);
        }

        return principal.getUser().getId();
    }

    /**
     * 사이트 정보
     */
    @GetMapping("/site-info")
    public ResponseEntity<ApiResult<List<SiteUrlResponse>>> getSiteInfo() {

        List<SiteUrlResponse> siteList = Arrays.stream(SiteUrlInfo.values())
                .map(SiteUrlResponse::from)
                .toList();
        return ResponseEntity.ok(ApiResult.success("사이트 목록 조회", siteList));
    }

}