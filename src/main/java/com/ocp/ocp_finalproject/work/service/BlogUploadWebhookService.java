package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.content.domain.AiContent;
import com.ocp.ocp_finalproject.content.repository.AiContentRepository;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.dto.request.BlogUploadWebhookRequest;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import com.ocp.ocp_finalproject.work.util.WebhookTimeParser;
import java.time.LocalDateTime;

import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowTestStatus;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class BlogUploadWebhookService {

    private final WorkRepository workRepository;
    private final AiContentRepository aiContentRepository;
    private final WorkflowRepository workflowRepository;

    @Transactional
    public void handleResult(BlogUploadWebhookRequest request) {
        Long workId = request.getWorkId();
        if (workId == null) {
            throw new CustomException(ErrorCode.WORK_NOT_FOUND, "워크 ID가 누락되었습니다.");
        }

        Work work = workRepository.findById(workId)
                .orElseThrow(() -> new CustomException(ErrorCode.WORK_NOT_FOUND, "워크를 찾을 수 없습니다. workId=" + workId));

        AiContent aiContent = aiContentRepository.findByWorkId(workId)
                .orElseThrow(() -> new CustomException(ErrorCode.AI_CONTENT_NOT_FOUND, "콘텐츠를 찾을 수 없습니다. workId=" + workId));

        LocalDateTime completedAt = WebhookTimeParser.toUtcOrNow(request.getCompletedAt());

        log.info("웹훅 결과 수신 workId={} success={} postingUrl={} completedAt={}", workId, request.isSuccess(), request.getPostingUrl(), completedAt);
        work.updateUrlCompletion(request.getPostingUrl(), request.isSuccess(), completedAt);
        aiContent.updateBlogUploadResult(request.isSuccess(), completedAt);

        // 테스트 워크플로우 상태 업데이트
        updateTestStatusIfNeeded(work, request.isSuccess());
    }

    private void updateTestStatusIfNeeded(Work work, boolean isSuccess) {
        Workflow workflow = work.getWorkflow();

        if (workflow == null || workflow.getTestStatus() == null) {
            return;  // 테스트 워크플로우가 아니면 무시
        }

        WorkflowTestStatus newStatus = isSuccess
                ? WorkflowTestStatus.TEST_PASSED
                : WorkflowTestStatus.TEST_FAILED;

        workflow.updateTestStatus(newStatus);

        log.info("워크플로우 {} 테스트 상태 업데이트: {} -> {}",
                workflow.getId(),
                workflow.getTestStatus(),
                newStatus);
    }
}
