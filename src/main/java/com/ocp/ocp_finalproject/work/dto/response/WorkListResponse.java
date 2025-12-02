package com.ocp.ocp_finalproject.work.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WorkListResponse {
    Long workId;
    String status;
    String postingUrl;
    LocalDateTime completedAt;
    String choiceProduct;
}
