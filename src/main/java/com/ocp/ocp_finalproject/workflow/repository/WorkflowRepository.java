package com.ocp.ocp_finalproject.workflow.repository;

import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.dto.response.WorkflowListResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface WorkflowRepository extends JpaRepository<Workflow, Long> {

    @Query("""
            SELECT new com.ocp.ocp_finalproject.workflow.dto.response.WorkflowListResponse(
                wf.id,
                u.id,
                wf.siteUrl,
                bt.blogTypeName,
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
            LEFT JOIN ub.blogType bt
            WHERE u.id = :userId AND wf.status != 'DELETED'
    """)
    Page<WorkflowListResponse> findWorkflows(@Param("userId") Long userId, Pageable pageable);

    @Query("""
            SELECT wf
            FROM Workflow wf
            JOIN FETCH wf.user u
            JOIN FETCH wf.trendCategory tc
            LEFT JOIN FETCH wf.recurrenceRule rr
            JOIN FETCH wf.userBlog ub
            LEFT JOIN FETCH ub.blogType bt
            WHERE u.id = :userId AND wf.id = :workflowId
    """)
    Optional<Workflow> findWorkflow(@Param("userId") Long userId, @Param("workflowId") Long workflowId);

    /**
     *
     * 해당 메서드는 SpringBoot가 실행될 때 활성화된 Workflow를 Quartz 스케줄링하기 위해서 사용되는 메서드
     *
     * */
    @Query("""
        SELECT wf
        FROM Workflow wf
        LEFT JOIN FETCH wf.recurrenceRule rr
        WHERE wf.status = 'ACTIVE'
    """)
    List<Workflow> findAllActive();

}
