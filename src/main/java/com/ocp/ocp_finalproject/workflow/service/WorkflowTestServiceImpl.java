package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.integration.airflow.AirflowTriggerClient;
import com.ocp.ocp_finalproject.message.blog.BlogUploadProducer;
import com.ocp.ocp_finalproject.message.blog.dto.BlogUploadRequest;
import com.ocp.ocp_finalproject.message.content.ContentGenerateProducer;
import com.ocp.ocp_finalproject.message.content.dto.ContentGenerateRequest;
import com.ocp.ocp_finalproject.user.domain.UserPrincipal;
import com.ocp.ocp_finalproject.work.service.BlogUploadService;
import com.ocp.ocp_finalproject.work.service.ContentGenerateService;
import com.ocp.ocp_finalproject.workflow.dto.request.WorkflowRequest;
import com.ocp.ocp_finalproject.workflow.dto.response.WorkflowResponse;
import com.ocp.ocp_finalproject.workflow.dto.response.WorkflowTestResponse;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowTestStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.UNAUTHORIZED;

@Slf4j
@Service
@RequiredArgsConstructor
public class WorkflowTestServiceImpl implements WorkflowTestService {

    private final WorkflowService workflowService;
    private final ContentGenerateService contentGenerateService;
    private final ContentGenerateProducer contentGenerateProducer;
    private final BlogUploadService blogUploadService;
    private final BlogUploadProducer blogUploadProducer;
    private final AirflowTriggerClient airflowTriggerClient;

    @Override
    @Transactional
    public WorkflowTestResponse executeWorkflowTest(
            UserPrincipal principal,
            WorkflowRequest workflowRequest
    ) throws SchedulerException {
        // 1. 사용자 ID 검증
        Long userId = validateAndGetUserId(principal);

        // 2. 워크플로우 생성
        WorkflowResponse workflow = workflowService.createWorkflow(userId, workflowRequest);

        Long workflowId = workflow.getWorkflowId();

        workflowService.markWorkflowAsTest(workflowId);

        // 3. 콘텐츠 생성 요청 전송
        generateContent(workflowId);

        // 4. Airflow 트렌드 파이프라인 트리거
        triggerAirflow(workflowId);

        // 5. 블로그 업로드 요청 수집 및 전송
        int uploadCount = uploadBlogPosting(workflowId);

        log.info("워크플로우 {} 테스트 완료: 콘텐츠 생성 1건, 블로그 업로드 {}건",
                workflowId, uploadCount);

        // 6. 응답 생성
        return WorkflowTestResponse.builder()
                .workflowId(workflowId)
                .contentGenerateRequested(true)
                .blogUploadCount(uploadCount)
                .testStatus(WorkflowTestStatus.NOT_TESTED)
                .message("워크플로우 생성 및 테스트 실행 완료")
                .build();
    }


    private Long validateAndGetUserId(UserPrincipal principal) {
        if (principal == null || principal.getUser() == null) {
            throw new CustomException(UNAUTHORIZED);
        }

        return principal.getUser().getId();
    }

    // 3. 콘텐츠 생성 요청 전송
    private void generateContent(Long workflowId) {
        ContentGenerateRequest contentRequest = contentGenerateService.createRequest(workflowId);
        contentGenerateService.applyWebhookSettings(contentRequest);
        contentGenerateService.markWorkRequested(contentRequest.getWorkId());
        contentGenerateProducer.send(contentRequest);
        log.info("워크플로우 {} 콘텐츠 생성 메시지 전송 완료", workflowId);
    }

    // 4. Airflow 트렌드 파이프라인 트리거
    private void triggerAirflow(Long workflowId) {
        airflowTriggerClient.triggerTrendPipeline(workflowId);
        log.info("워크플로우 {} Airflow 파이프라인 트리거 완료", workflowId);
    }

    // 5. 블로그 업로드 요청 수집 및 전송
    private int uploadBlogPosting(Long workflowId) {
        List<BlogUploadRequest> blogRequests =
                blogUploadService.collectPendingBlogUploadsForWorkflow(workflowId);

        int uploadCount = 0;
        for (BlogUploadRequest request : blogRequests) {
            BlogUploadRequest prepared = blogUploadService.prepareBlogUploadRequest(request);
            blogUploadProducer.send(prepared);
            uploadCount++;
            log.info("워크 {} 블로그 업로드 메시지 전송", prepared.getWorkId());
        }

        return uploadCount;
    }
}