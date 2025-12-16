package com.ocp.ocp_finalproject.admin.dto.response;

import com.ocp.ocp_finalproject.monitoring.domain.AiUsageLog;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AiUsageLogResponse {

    @Schema(description = "로그 ID", example = "1")
    private Long id;

    @Schema(description = "사용자 ID", example = "5")
    private Long userId;

    @Schema(description = "작업 ID", example = "10")
    private Long workId;

    @Schema(description = "기능 타입", example = "CONTENT_GENERATION")
    private String featureType;

    @Schema(description = "AI 모델", example = "gpt-4")
    private String model;

    @Schema(description = "프롬프트 토큰 수", example = "500")
    private Integer promptTokens;

    @Schema(description = "완성 토큰 수", example = "1500")
    private Integer completionTokens;

    @Schema(description = "총 토큰 수", example = "2000")
    private Integer totalTokens;

    @Schema(description = "예상 비용", example = "0.06")
    private BigDecimal estimatedCost;

    @Schema(description = "생성 일시", example = "2025-12-16T15:30:00")
    private LocalDateTime createdAt;

    public static AiUsageLogResponse from(AiUsageLog log) {
        return AiUsageLogResponse.builder()
                .id(log.getId())
                .userId(log.getUserId())
                .workId(log.getWorkId())
                .featureType(log.getFeatureType())
                .model(log.getModel())
                .promptTokens(log.getPromptTokens())
                .completionTokens(log.getCompletionTokens())
                .totalTokens(log.getTotalTokens())
                .estimatedCost(log.getEstimatedCost())
                .createdAt(log.getCreatedAt())
                .build();
    }
}