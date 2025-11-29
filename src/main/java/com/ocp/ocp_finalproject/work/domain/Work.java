package com.ocp.ocp_finalproject.work.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "work")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Work extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "work_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "workflow_id")
    private Workflow workflow;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 50)
    private WorkExecutionStatus status;

    @Column(name="posting_url")
    private String postingUrl;

    @Column(name = "started_at", nullable = false)
    private LocalDateTime startedAt;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @Builder(builderMethodName = "createBuilder")
    public static Work create(Workflow workflow, WorkExecutionStatus status, LocalDateTime startedAt, LocalDateTime completedAt) {
        Work work = new Work();
        work.workflow = workflow;
        work.status = status;
        work.startedAt = startedAt;
        work.completedAt = completedAt;
        return work;
    }

    public void setPostingUrl(String postingUrl, boolean success) {
        this.postingUrl = postingUrl;
        if(success){
            this.status=WorkExecutionStatus.COMPLETED;
        }else {
            this.status=WorkExecutionStatus.FAILED;
        }
    }

}
