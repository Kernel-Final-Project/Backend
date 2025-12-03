package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.dto.request.BlogUploadWebhookRequest;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class BlogUploadWebhookService {

    private final WorkRepository workRepository;

    @Transactional
    public void handleResult(BlogUploadWebhookRequest request) {
        Long workId = request.getWorkId();
        if (workId == null) {
            throw new CustomException(ErrorCode.WORK_NOT_FOUND, "워크 ID가 누락되었습니다.");
        }

        Work work = workRepository.findById(workId)
                .orElseThrow(() -> new CustomException(ErrorCode.WORK_NOT_FOUND, "워크를 찾을 수 없습니다. workId=" + workId));

        LocalDateTime completedAt = request.getCompletedAt() != null
                ? request.getCompletedAt().withOffsetSameInstant(ZoneOffset.UTC).toLocalDateTime()
                : LocalDateTime.now(ZoneOffset.UTC);

        log.info("웹훅 결과 수신 workId={} success={} postingUrl={} completedAt={}", workId, request.isSuccess(), request.getPostingUrl(), completedAt);
        work.updateUrlCompletion(request.getPostingUrl(), request.isSuccess(), completedAt);
    }
}
