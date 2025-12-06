package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.content.domain.AiContent;
import com.ocp.ocp_finalproject.content.repository.AiContentRepository;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.dto.request.ContentGenerateWebhookRequest;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import com.ocp.ocp_finalproject.work.util.WebhookTimeParser;
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

        Boolean successFlag = request.getSuccess();
        if (successFlag == null) {
            throw new CustomException(ErrorCode.INVALID_INPUT_VALUE, "성공 여부가 누락되었습니다.");
        }

        LocalDateTime completedAt = WebhookTimeParser.toUtcOrNow(request.getCompletedAt());

        boolean isSuccess = successFlag;
        log.info("콘텐츠 생성 웹훅 수신 workId={} success={} title={}", workId, isSuccess, request.getTitle());

        aiContent.updateContentGeneration(isSuccess, request.getTitle(), request.getSummary(), request.getContent(), completedAt);
        work.updateContentGeneration(isSuccess, completedAt);
    }
}
