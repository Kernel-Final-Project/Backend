package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.content.domain.AiContent;
import com.ocp.ocp_finalproject.content.repository.AiContentRepository;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.dto.request.KeywordSelectWebhookRequest;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneOffset;

@Slf4j
@Service
@RequiredArgsConstructor
public class KeywordSelectWebhookService {

    private final WorkRepository workRepository;
    private final AiContentRepository aiContentRepository;

    @Transactional
    public void handleResult(KeywordSelectWebhookRequest request) {
        Long workId = request.getWorkId();
        if (workId == null) {
            throw new CustomException(ErrorCode.WORK_NOT_FOUND, "워크 ID가 누락되었습니다.");
        }

        Work work = workRepository.findById(workId)
                .orElseThrow(() -> new CustomException(ErrorCode.WORK_NOT_FOUND, "워크를 찾을 수 없습니다. workId=" + workId));

        AiContent ai = aiContentRepository.findByWorkId(workId)
                .orElseThrow(() -> new CustomException(ErrorCode.AI_CONTENT_NOT_FOUND,"콘텐츠를 찾을 수 없습니다. workId="+workId));


        LocalDateTime startedAt = request.getStartedAt() != null
                ? request.getStartedAt().withOffsetSameInstant(ZoneOffset.UTC).toLocalDateTime()
                : LocalDateTime.now(ZoneOffset.UTC);

        LocalDateTime completedAt = request.getCompletedAt() != null
                ? request.getCompletedAt().withOffsetSameInstant(ZoneOffset.UTC).toLocalDateTime()
                : LocalDateTime.now(ZoneOffset.UTC);


        log.info("웹훅 결과 수신 workId={} success={} keyword={} startedAt={} completedAt={}", workId, request.isSuccess(), request.getKeyword(), startedAt, completedAt);

        work.updateKeywordCompletion(request.isSuccess(),startedAt,completedAt);
        ai.updateKeywordCompletion(request.isSuccess(),request.getKeyword(),startedAt,completedAt);
    }
}
