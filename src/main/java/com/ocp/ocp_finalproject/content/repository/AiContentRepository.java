package com.ocp.ocp_finalproject.content.repository;

import com.ocp.ocp_finalproject.content.domain.AiContent;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
     * 일별 발행된 포스팅 수 조회 (날짜-시간 범위)
     *
     * 성능 최적화: LocalDateTime 범위 비교를 사용하여 인덱스 활용 가능 (SARGable)
     * DATE(), YEAR(), MONTH() 같은 함수를 WHERE 절에서 사용하지 않음
     *
     * @param startDateTime 시작 날짜-시간 (포함)
     * @param endDateTime 종료 날짜-시간 (미포함)
     * @return [LocalDate statDate, Long postCount] 형식의 Object[] 리스트
     */
    @Query("""
        SELECT DATE(ac.completedAt) as statDate, COUNT(ac) as postCount
        FROM AiContent ac
        WHERE ac.status = 'PUBLISHED'
            AND ac.completedAt >= :startDateTime
            AND ac.completedAt < :endDateTime
        GROUP BY DATE(ac.completedAt)
        ORDER BY DATE(ac.completedAt) ASC
    """)
    List<Object[]> countPublishedPostsByDateRange(
            @Param("startDateTime") LocalDateTime startDateTime,
            @Param("endDateTime") LocalDateTime endDateTime
    );
}
