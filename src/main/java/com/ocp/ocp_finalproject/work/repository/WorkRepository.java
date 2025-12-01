package com.ocp.ocp_finalproject.work.repository;

import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface WorkRepository extends JpaRepository<Work, Long> {

    @Query("""
            SELECT w
            FROM Work w
            JOIN FETCH w.workflow wf
            LEFT JOIN FETCH wf.userBlog ub
            LEFT JOIN FETCH ub.blogType bt
            LEFT JOIN FETCH wf.recurrenceRule rr
            WHERE w.status = :status
            """)
    List<Work> findByStatusWithWorkflow(@Param("status") WorkExecutionStatus status);
}
