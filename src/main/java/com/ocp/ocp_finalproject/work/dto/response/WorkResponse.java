package com.ocp.ocp_finalproject.work.dto.response;

import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Builder
@Getter
public class WorkResponse {
    private Long workId;

    private String postingUrl;

    private LocalDateTime completedAt;

    private String choiceProduct;

    private String title;

    private String content;

    private String choiceTrendKeyword;

    private WorkExecutionStatus status;

}