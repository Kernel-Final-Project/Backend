package com.ocp.ocp_finalproject.workflow.repository;

import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.dto.WorkflowResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkflowRepository extends JpaRepository<Workflow, Long> {

    @Query("""
            SELECT new com.ocp.ocp_finalproject.workflow.dto.WorkflowResponse(
                wf.id,
                u.id,
                sui.siteUrl,
                ub.blogUrl,
                new com.ocp.ocp_finalproject.workflow.dto.SetTrendCategoryDto(
                    tc.depth1Category.name,
                    tc.depth2Category.name,
                    tc.depth3Category.name
                ),
                ub.accountId,
                rr.readableRule,
                wf.status
            )
            FROM Workflow wf
            JOIN wf.user u
            JOIN wf.siteUrlInfo sui
            JOIN wf.setTrendCategory tc
            LEFT JOIN wf.recurrenceRule rr
            JOIN wf.userBlog ub
            WHERE u.id = :userId
    """)
    List<WorkflowResponse> findByUserId(@Param("userId") Long userId);
}
