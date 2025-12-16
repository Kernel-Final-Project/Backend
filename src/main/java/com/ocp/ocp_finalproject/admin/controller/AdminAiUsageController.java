package com.ocp.ocp_finalproject.admin.controller;

import com.ocp.ocp_finalproject.admin.dto.response.*;
import com.ocp.ocp_finalproject.admin.service.AdminAiUsageService;
import com.ocp.ocp_finalproject.common.response.ApiResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Tag(name = "관리자 - AI 토큰 사용량 관리")
@RestController
@RequestMapping("/api/v1/admin/ai-usage")
@RequiredArgsConstructor
public class AdminAiUsageController {

    private final AdminAiUsageService adminAiUsageService;

    @Operation(summary = "전체 토큰 사용 현황 요약", description = "전체, 오늘, 이번 달 토큰 사용량 및 비용을 조회합니다.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "토큰 사용 현황 조회 성공"),
            @ApiResponse(responseCode = "500", description = "서버 내부 오류")
    })
    @GetMapping("/summary")
    public ResponseEntity<ApiResult<AiUsageSummaryResponse>> getUsageSummary() {
        AiUsageSummaryResponse summary = adminAiUsageService.getUsageSummary();
        return ResponseEntity.ok(ApiResult.success("토큰 사용 현황 조회 성공", summary));
    }

    @Operation(summary = "사용자별 토큰 사용 통계", description = "기간별 사용자별 토큰 사용량 및 비용을 조회합니다.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "사용자별 통계 조회 성공"),
            @ApiResponse(responseCode = "500", description = "서버 내부 오류")
    })
    @GetMapping("/by-user")
    public ResponseEntity<ApiResult<List<UserUsageResponse>>> getUserUsageStatistics(
            @Parameter(description = "시작 날짜 (미입력시 1개월 전)", example = "2025-12-01")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,

            @Parameter(description = "종료 날짜 (미입력시 오늘)", example = "2025-12-16")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        List<UserUsageResponse> statistics = adminAiUsageService.getUserUsageStatistics(startDate, endDate);
        return ResponseEntity.ok(ApiResult.success("사용자별 통계 조회 성공", statistics));
    }

    @Operation(summary = "기능별 토큰 사용 통계", description = "기간별 기능별(콘텐츠 생성, 키워드 추출 등) 토큰 사용량을 조회합니다.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "기능별 통계 조회 성공"),
            @ApiResponse(responseCode = "500", description = "서버 내부 오류")
    })
    @GetMapping("/by-feature")
    public ResponseEntity<ApiResult<List<FeatureUsageResponse>>> getFeatureUsageStatistics(
            @Parameter(description = "시작 날짜 (미입력시 1개월 전)", example = "2025-12-01")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,

            @Parameter(description = "종료 날짜 (미입력시 오늘)", example = "2025-12-16")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        List<FeatureUsageResponse> statistics = adminAiUsageService.getFeatureUsageStatistics(startDate, endDate);
        return ResponseEntity.ok(ApiResult.success("기능별 통계 조회 성공", statistics));
    }

    @Operation(summary = "일별 토큰 사용 추이", description = "기간별 일별 토큰 사용 추이를 조회합니다. (차트용)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "사용 추이 조회 성공"),
            @ApiResponse(responseCode = "500", description = "서버 내부 오류")
    })
    @GetMapping("/trends")
    public ResponseEntity<ApiResult<List<UsageTrendResponse>>> getUsageTrends(
            @Parameter(description = "시작 날짜 (미입력시 1개월 전)", example = "2025-12-01")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,

            @Parameter(description = "종료 날짜 (미입력시 오늘)", example = "2025-12-16")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        List<UsageTrendResponse> trends = adminAiUsageService.getUsageTrends(startDate, endDate);
        return ResponseEntity.ok(ApiResult.success("사용 추이 조회 성공", trends));
    }

    @Operation(summary = "AI 사용 로그 상세 조회", description = "필터링 및 페이지네이션을 지원하는 AI 사용 로그 상세 조회")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "로그 조회 성공"),
            @ApiResponse(responseCode = "500", description = "서버 내부 오류")
    })
    @GetMapping("/logs")
    public ResponseEntity<ApiResult<Page<AiUsageLogResponse>>> getUsageLogs(
            @Parameter(description = "사용자 ID", example = "5")
            @RequestParam(required = false) Long userId,

            @Parameter(description = "기능 타입", example = "CONTENT_GENERATION")
            @RequestParam(required = false) String featureType,

            @Parameter(description = "시작 날짜", example = "2025-12-01")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,

            @Parameter(description = "종료 날짜", example = "2025-12-16")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,

            @ParameterObject Pageable pageable) {

        Page<AiUsageLogResponse> logs = adminAiUsageService.getUsageLogs(userId, featureType, startDate, endDate, pageable);
        return ResponseEntity.ok(ApiResult.success("로그 조회 성공", logs));
    }
}
