package com.ocp.ocp_finalproject.content.repository;

import com.ocp.ocp_finalproject.content.domain.AiContent;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AiContentRepository extends JpaRepository<AiContent, Long> {

    Optional<AiContent> findTopByWorkId(Long workId);

    List<AiContent> findByWorkIdIn(Collection<Long> workIds);

    Optional<AiContent> findByWorkId(Long workId);

    @Query("""
        SELECT ac.choiceTrendKeyword
        FROM AiContent ac
        WHERE ac.choiceTrendKeyword IS NOT NULL
          AND ac.work.workflow.id = :workflowId
        ORDER BY ac.completedAt DESC
    """)
    List<String> findRecentTrendKeywordsByWorkflowId(
            @Param("workflowId") Long workflowId,
            Pageable pageable
    );

    @Query("""
        SELECT ac.choiceProduct
        FROM AiContent ac
        WHERE ac.choiceProduct IS NOT NULL
          AND ac.work.workflow.id = :workflowId
        ORDER BY ac.completedAt DESC
    """)
    List<String> findRecentChoiceProductsByWorkflowId(@Param("workflowId") Long workflowId);

    // 포스팅 통계 조회 쿼리

    /*
    * 일별 발행된 포스팅 수 조회 (기간)
    * */
    @Query("""
        SELECT DATE(ac.completedAt) as statDate, COUNT(ac) as postCount
        FROM AiContent ac
        WHERE ac.status = 'PUBLISHED'
            AND DATE(ac.completedAt) BETWEEN :startDate AND :endDate
        GROUP BY DATE(ac.completedAt)
        ORDER BY DATE(ac.completedAt) ASC
    """)
    List<Object[]> countPublishedPostsByDateRange(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    /*
     * 주별/월별 집계를 위한 년월별 발행 포스트 조회
     * */
    @Query("""
          SELECT DATE(ac.completedAt) as statDate, COUNT(ac) as postCount
          FROM AiContent ac
          WHERE ac.status = 'PUBLISHED'
            AND YEAR(ac.completedAt) = :year
            AND MONTH(ac.completedAt) = :month
          GROUP BY DATE(ac.completedAt)
          ORDER BY DATE(ac.completedAt) ASC
      """)

    List<Object[]> countPublishedPostsByYearAndMonth(
            @Param("year") int year,
            @Param("month") int month
    );

    /*
     * 월별 집계를 위한 년도별 발행 포스트 조회
     * */
    @Query("""
          SELECT DATE(ac.completedAt) as statDate, COUNT(ac) as postCount
          FROM AiContent ac
          WHERE ac.status = 'PUBLISHED'
            AND YEAR(ac.completedAt) = :year
          GROUP BY DATE(ac.completedAt)
          ORDER BY DATE(ac.completedAt) ASC
      """)

    List<Object[]> countPublishedPostsByYear(@Param("year") int year);
}
