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
public class UserUsageResponse {

    @Schema(description = "사용자 ID", example = "1")
    private Long userId;

    @Schema(description = "사용자 이름", example = "홍길동")
    private String userName;

    @Schema(description = "사용자 이메일", example = "hong@example.com")
    private String userEmail;

    @Schema(description = "총 토큰 수", example = "250000")
    private Long totalTokens;

    @Schema(description = "총 비용", example = "7.50")
    private BigDecimal totalCost;

    @Schema(description = "요청 횟수", example = "150")
    private Long requestCount;
}