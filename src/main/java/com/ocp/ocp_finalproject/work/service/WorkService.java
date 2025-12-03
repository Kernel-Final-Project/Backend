package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.content.domain.AiContent;
import com.ocp.ocp_finalproject.content.repository.AiContentRepository;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.dto.response.WorkListResponse;
import com.ocp.ocp_finalproject.work.dto.response.WorkPageResponse;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.*;

@RequiredArgsConstructor
@Service
public class WorkService {

    private final WorkRepository workRepository;
    private final WorkflowRepository workflowRepository;
    private final AiContentRepository aiContentRepository;

    private static final int DEFAULT_PAGE_SIZE = 10;

    @Transactional(readOnly = true)
    public WorkPageResponse getWorks(Long userId, Long workflowId, int page) {
        if (page < 0) {
            throw new CustomException(INVALID_INPUT_VALUE, "페이지 번호는 0 이상의 정수여야 합니다.");
        }

        Workflow workflow = workflowRepository.findById(workflowId)
                .orElseThrow(() -> new CustomException(WORKFLOW_NOT_FOUND));

        validateWorkflowOwner(workflow, userId);

        PageRequest pageable = PageRequest.of(page, DEFAULT_PAGE_SIZE, Sort.by(Sort.Direction.DESC, "createdAt"));
        Page<Work> workPage = workRepository.findByWorkflowId(workflowId, pageable);
        List<Work> works = workPage.getContent();

        Map<Long, String> choiceProductByWorkId = fetchChoiceProductMap(works);

        List<WorkListResponse> responses = works.stream()
                .map(work -> WorkListResponse.builder()
                        .workId(work.getId())
                        .status(work.getStatus() != null ? work.getStatus().name() : null)
                        .postingUrl(work.getPostingUrl())
                        .completedAt(work.getCompletedAt())
                        .choiceProduct(choiceProductByWorkId.get(work.getId()))
                        .build())
                .collect(Collectors.toList());

        return WorkPageResponse.builder()
                .works(responses)
                .page(workPage.getNumber())
                .size(workPage.getSize())
                .totalElements(workPage.getTotalElements())
                .totalPages(workPage.getTotalPages())
                .last(workPage.isLast())
                .build();
    }

    private Map<Long, String> fetchChoiceProductMap(List<Work> works) {
        List<Long> workIds = works.stream()
                .map(Work::getId)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        if (workIds.isEmpty()) {
            return Collections.emptyMap();
        }

        return aiContentRepository.findByWorkIdIn(workIds).stream()
                .filter(aiContent -> aiContent.getWork() != null)
                .collect(Collectors.toMap(
                        aiContent -> aiContent.getWork().getId(),
                        AiContent::getChoiceProduct,
                        (existing, ignore) -> existing
                ));
    }

    private void validateWorkflowOwner(Workflow workflow, Long userId) {
        if (workflow.getUser() == null || workflow.getUser().getId() == null || !workflow.getUser().getId().equals(userId)) {
            throw new CustomException(NOT_WORKFLOW_OWNER);
        }
    }
}
