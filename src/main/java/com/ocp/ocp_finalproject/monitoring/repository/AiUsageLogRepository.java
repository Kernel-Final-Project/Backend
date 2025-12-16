package com.ocp.ocp_finalproject.monitoring.repository;

import com.ocp.ocp_finalproject.monitoring.domain.AiUsageLog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public interface AiUsageLogRepository extends JpaRepository<AiUsageLog, Long> {

    /*
    * 전체 토큰 사용량 합계 조회
    *
    * @return 총 토큰 수 (null인 경우 0)
    * */
    @Query("SELECT COALESCE(SUM(a.totalTokens), 0) FROM AiUsageLog a")
    Long sumTotalTokens();

    /*
    * 전체 예상 비용 합계 조회
    *
    * @return 총 예상 비용 (null인 경우 0)
    * */
    @Query("SELECT COALESCE(SUM(a.estimatedCost), 0) FROM AiUsageLog a")
    BigDecimal sumEstimatedCost();

    /*
    * 기간별 토큰 사용량 합계 조회
    *
    * @param startDate 시작 날짜 (포함)
    * @param endDate 종료 날짜 (포함)
    * @return 기간 내 총 토큰 수
    * */
    @Query("SELECT COALESCE(SUM(a.totalTokens), 0) FROM AiUsageLog a WHERE a.createdAt BETWEEN :startDate AND :endDate")
    Long sumTotalTokensByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    /*
    * 기간별 예상 비용 합계 조회
    *
    * @param startDate 시작 날짜 (포함)
    * @param endDate 종료 날짜 (포함)
    * @return 기간 내 총 예상 비용
    * */
    @Query("SELECT COALESCE(SUM(a.estimatedCost), 0) FROM AiUsageLog a WHERE a.createdAt BETWEEN :startDate AND :endDate")
    BigDecimal sumEstimatedCostByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    /*
    * 사용자별 토큰 사용 통계 조회 (기간 필터링)
    *
    * @param startDate 시작 날짜 (포함)
    * @param endDate 종료 날짜 (포함)
    * @return 사용자별 통계 리스트 [userId, totalTokens, estimatedCost), requestCount]
    * */
    @Query("SELECT a.userId, SUM(a.totalTokens), SUM(a.estimatedCost), COUNT(a)" +
           "FROM AiUsageLog a " +
           "WHERE a.createdAt BETWEEN :startDate AND :endDate " +
           "GROUP BY a.userId " +
           "ORDER BY SUM(a.totalTokens) DESC")
    List<Object[]> findUserUsageStatistics(@Param("startDate")LocalDateTime startDate, @Param("endDate")LocalDateTime endDate);

    /*
    * 기능별 토큰 사용 통계 조회 (기간 필터링)
    *
    * @param startDate  시작 날짜 (포함)
    * @param endDate 종료 날짜 (포함)
    * @return 일별 통계 리스트 [date, totalTokens, estimatedCost, requestCount]
    * */
    @Query("SELECT CAST(a.createdAt AS date), SUM(a.totalTokens), SUM(a.estimatedCost), COUNT(a) "+
           "FROM AiUsageLog a " +
           "WHERE a.createdAt BETWEEN :startDate AND :endDate " +
           "GROUP BY a.featureType " +
           "ORDER BY SUM(a.totalTokens) DESC" )
    List<Object[]> findFeatureUsageStatistics(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    /*
    * 일별 토큰 사용 추이 조회
    *
    * @param startDate 시작 날짜 (포함)
    * @param endDate 종료 날짜 (포함)
    * @return 일별 통계 리스트 [date, totalTokens, estimatedCost, requestCount]
    * */
    @Query("SELECT CAST(a.createdAt AS date ), SUM(a.totalTokens), SUM(a.estimatedCost), COUNT(a) " +
           "FROM AiUsageLog a " +
           "WHERE a.createdAt BETWEEN :startDate AND :endDate " +
           "GROUP BY CAST(a.createdAt AS date) " +
           "ORDER BY CAST(a.createdAt AS date) ASC" )
    List<Object[]> findDailyUsageTrends(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    /**
     * 상세 로그 조회 (필터링 + 페이지네이션)
     *
     * @param userId 사용자 ID (null 가능)
     * @param featureType 기능 타입 (null 가능)
     * @param startDate 시작 날짜 (null 가능)
     * @param endDate 종료 날짜 (null 가능)
     * @param pageable 페이지 정보
     * @return 로그 페이지
     */
    @Query("SELECT a FROM AiUsageLog a " +
            "WHERE (:userId IS NULL OR a.userId = :userId) " +
            "AND (:featureType IS NULL OR a.featureType = :featureType) " +
            "AND (:startDate IS NULL OR a.createdAt >= :startDate) " +
            "AND (:endDate IS NULL OR a.createdAt <= :endDate) " +
            "ORDER BY a.createdAt DESC")
    Page<AiUsageLog> findLogsWithFilters(@Param("userId") Long userId,
                                         @Param("featureType") String featureType,
                                         @Param("startDate") LocalDateTime startDate,
                                         @Param("endDate") LocalDateTime endDate,
                                         Pageable pageable);

    /**
     * 특정 사용자의 토큰 사용 내역 조회
     *
     * @param userId 사용자 ID
     * @param pageable 페이지 정보
     * @return 로그 페이지
     */
    Page<AiUsageLog> findByUserIdOrderByCreatedAtDesc(Long userId, Pageable pageable);

    /**
     * 특정 기능의 토큰 사용 내역 조회
     *
     * @param featureType 기능 타입
     * @param pageable 페이지 정보
     * @return 로그 페이지
     */
    Page<AiUsageLog> findByFeatureTypeOrderByCreatedAtDesc(String featureType, Pageable pageable);
}
