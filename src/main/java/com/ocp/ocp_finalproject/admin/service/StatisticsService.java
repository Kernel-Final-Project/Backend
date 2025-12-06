package com.ocp.ocp_finalproject.admin.service;

import com.ocp.ocp_finalproject.admin.dto.response.DailyUserStatisticsResponse;
import com.ocp.ocp_finalproject.admin.dto.response.MonthlyUserStatisticsResponse;
import com.ocp.ocp_finalproject.admin.dto.response.WeeklyUserStatisticsResponse;
import com.ocp.ocp_finalproject.monitoring.domain.SystemDailyStatistics;
import com.ocp.ocp_finalproject.monitoring.repository.SystemDailyStatisticsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
/*
* 관리자 통계 서비스
*
* 관리자가 조회하는 각종 통계 데이터를 제공하는 비즈니스 로직을 담당
* 일별, 주별, 월별 사용자 통계 조회 및 집계 기능을 제공
*
* 모든 조회 메서드는 읽기 전용 트랜잭션으로 실행
* */
public class StatisticsService {

    private final SystemDailyStatisticsRepository systemDailyStatisticsRepository;

    /*
    * 일별 사용자 통계 조회
    *
    * 지정된 기간의 일별 사용자 통계를 조회하여 반환
    * 각 날짜별로 총 사용자 수, 증가율, 활성 사용자 정보를 포함
    *
    * 데이터는 날짜 오름차순으로 정렬되어 반환
    *
    * @param startDate 조회 시작 날짜 (포함)
    * @param endDate 조회 종료 날짜 (포함)
    * @return 일별 사용자 통계 응답 리스트
    * */
    public List<DailyUserStatisticsResponse> getDailyUserStatistics(LocalDate startDate, LocalDate endDate) {
        log.info("일별 사용자 통계 조회 - startDate: {}, endDate: {}", startDate, endDate);

        // Repository를 통해 기간 내 통계 조회
        List<SystemDailyStatistics> statistics = systemDailyStatisticsRepository
                .findByStatDateBetweenOrderByStatDateAsc(startDate, endDate);

        log.info("조회된 일별 통계 건수: {}", statistics.size());

        // 엔티티를 DTO로 변환하여 반환
        return statistics.stream()
                .map(DailyUserStatisticsResponse::from)
                .collect(Collectors.toList());
    }

    /*
     * 주별 사용자 통계 조회
     *
     * 지정된 년월의 일별 데이터를 주 단위로 집계하여 반환
     *
     * <집계 방식>
     * 주차 계산: 월요일 시작
     * 총 사용자: 해당 주 마지막 날의 값 사용
     * 증가율: 해당 주 마지막 날의 값 사용
     * 활성 사용자: 해당 주의 일별 평균값 사용
     *
     * @param year 조회할 년도 (예: 2025)
     * @param month 조회할 월 (1-12)
     * @return 주별 사용자 통계 응답 리스트 (주차 오름차순)
     * */
    public List<WeeklyUserStatisticsResponse> getWeeklyUserStatistics(int year, int month) {
        log.info("주별 사용자 통계 - year: {}, month: {}", year, month);

        // 해당 년월의 모든 일별 통계 조회
        List<SystemDailyStatistics> statistics = systemDailyStatisticsRepository
                .findByYearAndMonth(year, month);

        log.info("주별 집계를 위한 일별 데이터 조회 건수: {}", statistics.size());

        // 주차별로 그룹화
        // 월요일 시작, 첫 주는 목요일을 포함한 주
        Map<Integer, List<SystemDailyStatistics>> weeklyGroup = statistics.stream()
                .collect(Collectors.groupingBy(stat ->
                        stat.getStatDate().get(WeekFields.ISO.weekOfMonth())
                ));

        log.info("집계된 주차 수: {}", weeklyGroup.size());

        // 각 주차별 데이터를 응답 DTO로 변환
        return weeklyGroup.entrySet().stream()
                .map(entry -> {
                    Integer weekNumber = entry.getKey();
                    List<SystemDailyStatistics> weekData = entry.getValue();

                    // 주의 시작일과 종료일 계산
                    LocalDate weekStart = weekData.getFirst().getStatDate();
                    LocalDate weekEnd = weekData.getLast().getStatDate();

                    // 주의 마지막 날 데이터 (총 사용자, 증가율 계산에 사용)
                    SystemDailyStatistics lastDayStat = weekData.getLast();

                    // 주간 평균 활성 사용자 계산
                    // 각 날짜의 활성 사용자 수를 평균
                    double avgActiveUsers = weekData.stream()
                            .mapToInt(SystemDailyStatistics::getActiveUsersToday)
                            .average()
                            .orElse(0.0);

                    log.debug("{}주차 집계 - 기간: {} ~ {}, 평균 활성 사용자: {}",
                            weekNumber, weekStart, weekEnd, avgActiveUsers);

                    return WeeklyUserStatisticsResponse.builder()
                            .weekNumber(weekNumber)
                            .weekPeriod(weekStart + " ~ " + weekEnd)
                            .totalUsers(lastDayStat.getTotalUsers())
                            .userGrowthRate(lastDayStat.getUserGrowthRate())
                            .activeUsers((long) avgActiveUsers)
                            .activeUserGrowthRate(lastDayStat.getActiveUserGrowthRate())
                            .build();
                })
                .sorted(Comparator.comparing(WeeklyUserStatisticsResponse::getWeekNumber))
                .collect(Collectors.toList());
    }

    /*
    * 월별 사용자 통계를 조회
    *
    * 지정된 년도의 월별 사용자 통계를 조회
    * 일별 데이터를 월 단위로 집계하여 1월부터 12월까지 반환
    *
    * <집계 방식>
    * 총 사용자: 해당 월 마지막 날의 값 사용
    * 증가율: 해당 월 마지막 날의 값 사용
    * 활성 사용자: 해당 월의 일별 평균값 사용
    *
    * @param year 조회할 년도 (예: 2025)
    * @return 월별 사용자 통계 리스트 (월 오름차순, 1월~12월)
    * */
    public List<MonthlyUserStatisticsResponse> getMonthlyUserStatistics(int year) {
        log.info("월별 사용자 통계 조회 - year: {}", year);

        // 해당 년도의 모든 일별 통계 조회
        List<SystemDailyStatistics> statistics = systemDailyStatisticsRepository.findByYear(year);

        log.info("월별 집계를 위한 일별 데이터 조회 건수: {}", statistics.size());

        //월별로 그룹화 (1~12)
        Map<Integer, List<SystemDailyStatistics>> monthlyGroup = statistics.stream()
                .collect(Collectors.groupingBy(stat -> stat.getStatDate().getMonthValue()));

        log.info("집계된 월 수: {}", monthlyGroup.size());

        // 각 월별 데이터를 응답 DTO로 변환
        return monthlyGroup.entrySet().stream()
                .map(entry -> {
                    Integer month = entry.getKey();
                    List<SystemDailyStatistics> monthData = entry.getValue();

                    // 월의 마지막 날 데이터 (총 사용자, 증가율 계산에 사용)
                    SystemDailyStatistics lastDayStat = monthData.getLast();

                    // 월간 평균 활성 사용자 계산
                    // 각 날짜의 활성 사용자 수를 평균
                    double avgActiveUsers = monthData.stream()
                            .mapToInt(SystemDailyStatistics::getActiveUsersToday)
                            .average()
                            .orElse(0.0);

                    log.debug("{}월 집계 - 일수: {}, 평균 활성 사용자: {}",
                            month, monthData.size(), avgActiveUsers);

                    return MonthlyUserStatisticsResponse.builder()
                            .month(month)
                            .monthName(String.format("%d-%02d", year, month))
                            .totalUsers(lastDayStat.getTotalUsers())
                            .userGrowthRate(lastDayStat.getUserGrowthRate())
                            .activeUsers((long) avgActiveUsers)
                            .activeUserGrowthRate(lastDayStat.getActiveUserGrowthRate())
                            .build();
                })
                .sorted(Comparator.comparing(MonthlyUserStatisticsResponse::getMonth))
                .collect(Collectors.toList());
    }

}
