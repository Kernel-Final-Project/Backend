package com.ocp.ocp_finalproject.admin.service;

import com.ocp.ocp_finalproject.admin.dto.response.*;
import com.ocp.ocp_finalproject.monitoring.domain.AiUsageLog;
import com.ocp.ocp_finalproject.monitoring.repository.AiUsageLogRepository;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminAiUsageService {

    private final AiUsageLogRepository aiUsageLogRepository;
    private final UserRepository userRepository;

    /**
     * 전체 토큰 사용 현황 요약 조회
     */
    public AiUsageSummaryResponse getUsageSummary() {
        // 전체 통계
        Long totalTokens = aiUsageLogRepository.sumTotalTokens();
        BigDecimal totalCost = aiUsageLogRepository.sumEstimatedCost();

        // 오늘 통계
        LocalDateTime todayStart = LocalDate.now().atStartOfDay();
        LocalDateTime todayEnd = LocalDate.now().atTime(LocalTime.MAX);
        Long todayTokens = aiUsageLogRepository.sumTotalTokensByDateRange(todayStart, todayEnd);
        BigDecimal todayCost = aiUsageLogRepository.sumEstimatedCostByDateRange(todayStart, todayEnd);

        // 이번 달 통계
        LocalDateTime monthStart = LocalDate.now().withDayOfMonth(1).atStartOfDay();
        LocalDateTime monthEnd = LocalDate.now().atTime(LocalTime.MAX);
        Long monthlyTokens = aiUsageLogRepository.sumTotalTokensByDateRange(monthStart, monthEnd);
        BigDecimal monthlyCost = aiUsageLogRepository.sumEstimatedCostByDateRange(monthStart, monthEnd);

        // 요청 수
        Long totalRequests = aiUsageLogRepository.count();
        Long todayRequests = aiUsageLogRepository.findLogsWithFilters(null, null, todayStart, todayEnd, Pageable.unpaged()).getTotalElements();

        return AiUsageSummaryResponse.builder()
                .totalTokens(totalTokens)
                .totalCost(totalCost)
                .todayTokens(todayTokens)
                .todayCost(todayCost)
                .monthlyTokens(monthlyTokens)
                .monthlyCost(monthlyCost)
                .totalRequests(totalRequests)
                .todayRequests(todayRequests)
                .build();
    }

    /**
     * 사용자별 토큰 사용 통계 조회
     */
    public List<UserUsageResponse> getUserUsageStatistics(LocalDate startDate, LocalDate endDate) {
        LocalDateTime start = startDate != null ? startDate.atStartOfDay() : LocalDateTime.now().minusMonths(1);
        LocalDateTime end = endDate != null ? endDate.atTime(LocalTime.MAX) : LocalDateTime.now();

        List<Object[]> statistics = aiUsageLogRepository.findUserUsageStatistics(start, end);

        // userId 목록 추출
        List<Long> userIds = statistics.stream()
                .map(row -> (Long) row[0])
                .collect(Collectors.toList());

        // User 정보 조회
        Map<Long, User> userMap = userRepository.findAllById(userIds).stream()
                .collect(Collectors.toMap(User::getId, user -> user));

        return statistics.stream()
                .map(row -> {
                    Long userId = (Long) row[0];
                    Long totalTokens = ((Number) row[1]).longValue();
                    BigDecimal totalCost = (BigDecimal) row[2];
                    Long requestCount = ((Number) row[3]).longValue();

                    User user = userMap.get(userId);

                    return UserUsageResponse.builder()
                            .userId(userId)
                            .userName(user != null ? user.getName() : "Unknown")
                            .userEmail(user != null ? user.getEmail() : "Unknown")
                            .totalTokens(totalTokens)
                            .totalCost(totalCost)
                            .requestCount(requestCount)
                            .build();
                })
                .collect(Collectors.toList());
    }

    /**
     * 기능별 토큰 사용 통계 조회
     */
    public List<FeatureUsageResponse> getFeatureUsageStatistics(LocalDate startDate, LocalDate endDate) {
        LocalDateTime start = startDate != null ? startDate.atStartOfDay() : LocalDateTime.now().minusMonths(1);
        LocalDateTime end = endDate != null ? endDate.atTime(LocalTime.MAX) : LocalDateTime.now();

        List<Object[]> statistics = aiUsageLogRepository.findFeatureUsageStatistics(start, end);

        // 전체 토큰 수 계산 (비율 계산용)
        Long totalTokensAll = statistics.stream()
                .map(row -> ((Number) row[1]).longValue())
                .reduce(0L, Long::sum);

        return statistics.stream()
                .map(row -> {
                    String featureType = (String) row[0];
                    Long totalTokens = ((Number) row[1]).longValue();
                    BigDecimal totalCost = (BigDecimal) row[2];
                    Long requestCount = ((Number) row[3]).longValue();

                    // 비율 계산
                    BigDecimal usagePercentage = totalTokensAll > 0
                            ? BigDecimal.valueOf(totalTokens)
                            .multiply(BigDecimal.valueOf(100))
                            .divide(BigDecimal.valueOf(totalTokensAll), 2, RoundingMode.HALF_UP)
                            : BigDecimal.ZERO;

                    return FeatureUsageResponse.builder()
                            .featureType(featureType)
                            .totalTokens(totalTokens)
                            .totalCost(totalCost)
                            .requestCount(requestCount)
                            .usagePercentage(usagePercentage)
                            .build();
                })
                .collect(Collectors.toList());
    }

    /**
     * 일별 토큰 사용 추이 조회
     */
    public List<UsageTrendResponse> getUsageTrends(LocalDate startDate, LocalDate endDate) {
        LocalDateTime start = startDate != null ? startDate.atStartOfDay() : LocalDateTime.now().minusMonths(1);
        LocalDateTime end = endDate != null ? endDate.atTime(LocalTime.MAX) : LocalDateTime.now();

        List<Object[]> trends = aiUsageLogRepository.findDailyUsageTrends(start, end);

        return trends.stream()
                .map(row -> {
                    LocalDate date = (LocalDate) row[0];
                    Long totalTokens = ((Number) row[1]).longValue();
                    BigDecimal totalCost = (BigDecimal) row[2];
                    Long requestCount = ((Number) row[3]).longValue();

                    return UsageTrendResponse.builder()
                            .date(date)
                            .totalTokens(totalTokens)
                            .totalCost(totalCost)
                            .requestCount(requestCount)
                            .build();
                })
                .collect(Collectors.toList());
    }

    /**
     * 상세 로그 조회 (필터링 + 페이지네이션)
     */
    public Page<AiUsageLogResponse> getUsageLogs(Long userId, String featureType,
                                                 LocalDate startDate, LocalDate endDate,
                                                 Pageable pageable) {
        LocalDateTime start = startDate != null ? startDate.atStartOfDay() : null;
        LocalDateTime end = endDate != null ? endDate.atTime(LocalTime.MAX) : null;

        Page<AiUsageLog> logs = aiUsageLogRepository.findLogsWithFilters(userId, featureType, start, end, pageable);

        return logs.map(AiUsageLogResponse::from);
    }
}
