package com.ocp.ocp_finalproject.content.repository;

import com.ocp.ocp_finalproject.content.domain.AiContent;
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
        ORDER BY ac.completedAt DESC
    """)
    List<String> findRecentChoiceProducts();
}
