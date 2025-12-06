package com.ocp.ocp_finalproject.monitoring.dto.response;

import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class WorkInfoResponse {

    private Long workflowId;

    private Long workId;

    private Integer viewCount;

    private String blogPostUrl;

    private String choiceProduct;

    private LocalDateTime createdAt;

    private WorkExecutionStatus status;

}
