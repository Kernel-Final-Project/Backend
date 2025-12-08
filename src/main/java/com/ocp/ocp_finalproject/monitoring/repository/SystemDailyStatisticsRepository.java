package com.ocp.ocp_finalproject.monitoring.repository;

import com.ocp.ocp_finalproject.monitoring.domain.SystemDailyStatistics;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface SystemDailyStatisticsRepository extends JpaRepository<SystemDailyStatistics, Long> {

    /*
    * 일별 통계 조회 (기간)
    *
    * 날짜 범위로 조회하여 인덱스 활용 가능 (SARGable)
    * YEAR(), MONTH() 같은 함수를 WHERE 절에서 사용하지 않음
    *
    * @param startDate 시작 날짜 (포함)
    * @param endDate 종료 날짜 (포함)
    * @return 기간 내 일별 통계 리스트 (날짜 오름차순)
    * */
    List<SystemDailyStatistics> findByStatDateBetweenOrderByStatDateAsc(LocalDate startDate, LocalDate endDate);
}
