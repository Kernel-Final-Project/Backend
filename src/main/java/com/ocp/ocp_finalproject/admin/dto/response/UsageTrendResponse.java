package com.ocp.ocp_finalproject.admin.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UsageTrendResponse {

    @Schema(description = "날짜", example = "2025-12-16")
    private LocalDate date;

    @Schema(description = "총 토큰 수", example = "50000")
    private Long totalTokens;

    @Schema(description = "총 비용", example = "1.50")
    private BigDecimal totalCost;

    @Schema(description = "요청 횟수", example = "120")
    private Long requestCount;
}
