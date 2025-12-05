package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.content.domain.AiContent;
import com.ocp.ocp_finalproject.content.repository.AiContentRepository;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.dto.request.ContentGenerateWebhookRequest;
import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentGenerateWebhookService {

    private final WorkRepository workRepository;
    private final AiContentRepository aiContentRepository;

    @Transactional
    public void handleResult(ContentGenerateWebhookRequest request) {
        Long workId = request.getWorkId();
        if (workId == null) {
            throw new CustomException(ErrorCode.WORK_NOT_FOUND, "워크 ID가 누락되었습니다.");
        }

        Work work = workRepository.findById(workId)
                .orElseThrow(() -> new CustomException(ErrorCode.WORK_NOT_FOUND, "워크를 찾을 수 없습니다. workId=" + workId));

        AiContent aiContent = aiContentRepository.findByWorkId(workId)
                .orElseThrow(() -> new CustomException(ErrorCode.AI_CONTENT_NOT_FOUND, "콘텐츠를 찾을 수 없습니다. workId=" + workId));

        LocalDateTime completedAt = LocalDateTime.now();

        log.info("콘텐츠 생성 웹훅 수신 workId={} title={}", workId, request.getTitle());

        aiContent.updateContentGeneration(true, request.getTitle(), request.getSummary(), request.getContent(), completedAt);
        work.updateContentGeneration(true, completedAt);
    }
}
