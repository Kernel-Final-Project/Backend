package com.ocp.ocp_finalproject.workflow.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowStatus;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "workflow")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Workflow extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "workflow_id")
    private Long workflowId;

    @OneToMany(mappedBy = "workflow", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Work> works = new ArrayList<>();

    @OneToMany(mappedBy = "workflow", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RecurrenceRule> recurrenceRules = new ArrayList<>();

    @Column(name = "is_test", nullable = false)
    private Boolean isTest = false;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 50)
    private WorkflowStatus status;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = true;

    @Builder(builderMethodName = "createBuilder")
    public static Workflow create(WorkflowStatus status, Boolean isTest, Boolean isActive) {
        Workflow workflow = new Workflow();
        workflow.status = status;
        workflow.isTest = (isTest != null) ? isTest : false;
        workflow.isActive = (isActive != null) ? isActive : true;
        return workflow;
    }

}
