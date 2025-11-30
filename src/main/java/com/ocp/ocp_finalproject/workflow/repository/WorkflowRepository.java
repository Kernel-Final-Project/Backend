package com.ocp.ocp_finalproject.workflow.repository;

import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.dto.WorkflowListResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkflowRepository extends JpaRepository<Workflow, Long> {

    @Query("""
            SELECT new com.ocp.ocp_finalproject.workflow.dto.WorkflowListResponse(
                wf.id,
                u.id,
                wf.siteUrl,
                ub.blogUrl,
                tc.trendCategoryName,
                ub.accountId,
                rr.readableRule,
                wf.status
            )
            FROM Workflow wf
            JOIN wf.user u
            JOIN wf.trendCategory tc
            LEFT JOIN wf.recurrenceRule rr
            JOIN wf.userBlog ub
            WHERE u.id = :userId
    """)
    List<WorkflowListResponse> findByUserId(@Param("userId") Long userId);
}
