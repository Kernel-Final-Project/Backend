package com.ocp.ocp_finalproject.admin.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AiUsageSearchRequest {

    @Schema(description = "시작 날짜", example = "2025-12-01")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate startDate;

    @Schema(description = "종료 날짜", example = "2025-12-16")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate endDate;

    @Schema(description = "사용자 ID (상세 로그 조회용)", example = "5")
    private Long userId;

    @Schema(description = "기능 타입 (상세 로그 조회용)", example = "CONTENT_GENERATION")
    private String featureType;
}
