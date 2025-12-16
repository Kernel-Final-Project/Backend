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
public class AiUsageSummaryResponse {

    @Schema(description = "총 토큰 수", example = "1500000")
    private Long totalTokens;

    @Schema(description = "총 비용", example = "45.50")
    private BigDecimal totalCost;

    @Schema(description = "오늘 토큰 수", example = "50000")
    private Long todayTokens;

    @Schema(description = "오늘 비용", example = "1.50")
    private BigDecimal todayCost;

    @Schema(description = "이번 달 토큰 수", example = "500000")
    private Long monthlyTokens;

    @Schema(description = "이번 달 비용", example = "15.00")
    private BigDecimal monthlyCost;

    @Schema(description = "총 AI 요청 수", example = "3500")
    private Long totalRequests;

    @Schema(description = "오늘 AI 요청 수", example = "120")
    private Long todayRequests;
}