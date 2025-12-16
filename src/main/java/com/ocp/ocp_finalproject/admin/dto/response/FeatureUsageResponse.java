package com.ocp.ocp_finalproject.admin.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FeatureUsageResponse {

    @Schema(description = "기능 타입", example = "CONTENT_GENERATION")
    private String featureType;

    @Schema(description = "총 토큰 수", example = "800000")
    private Long totalTokens;

    @Schema(description = "총 비용", example = "24.00")
    private BigDecimal totalCost;

    @Schema(description = "요청 횟수", example = "500")
    private Long requestCount;

    @Schema(description = "전체 대비 비율 (%)", example = "53.33")
    private BigDecimal usagePercentage;
}