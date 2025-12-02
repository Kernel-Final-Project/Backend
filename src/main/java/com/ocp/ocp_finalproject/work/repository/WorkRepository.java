package com.ocp.ocp_finalproject.work.repository;

import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface WorkRepository extends JpaRepository<Work, Long> {

    /**
     * BlogUploadService에서 work 조회 시 사용되는 메서드
     *
     */
    @Query("""
        SELECT w
        FROM Work w
        JOIN FETCH w.workflow wf
        JOIN FETCH wf.userBlog ub
        LEFT JOIN FETCH ub.blogType bt
        WHERE wf.id = :workflowId
          AND w.status = :status
    """)
    List<Work> findWorksWithBlog(
            @Param("workflowId") Long workflowId,
            @Param("status") WorkExecutionStatus status
    );
}
