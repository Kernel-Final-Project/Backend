package com.ocp.ocp_finalproject.monitoring.repository;

import com.ocp.ocp_finalproject.monitoring.domain.SystemDailyStatistics;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface SystemDailyStatisticsRepository extends JpaRepository<SystemDailyStatistics, Long> {

    /*
    * 일별 통계 조회 (기간)
    * */
    List<SystemDailyStatistics> findByStatDateBetweenOrderByStatDateAsc(LocalDate startDate, LocalDate endDate);

    /*
    * 주별 통계 조회 (년, 월)
    * */
    @Query("SELECT s FROM SystemDailyStatistics s " +
           "WHERE YEAR(s.statDate) = :year " +
           "AND MONTH(s.statDate) = :month " +
           "ORDER BY s.statDate ASC")
    List<SystemDailyStatistics> findByYearAndMonth(@Param("year") int year, @Param("month") int month);

    /*
    * 월별 통계 조회 (년)
    * */
    @Query("SELECT s FROM SystemDailyStatistics s " +
           "WHERE YEAR(s.statDate) = :year " +
           "ORDER BY s.statDate ASC")
    List<SystemDailyStatistics> findByYear(@Param("year") int year);
}
