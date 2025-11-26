package com.ocp.ocp_finalproject.workflow.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "recurrence_rule")
@NoArgsConstructor
@AllArgsConstructor
public class RecurrenceRule extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long recurrenceRuleId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "workflow_id")
    private Workflow workflow;

    @Column(name = "repeat_type")
    private int interval;

    @Column(name = "days_of_week")
    private String daysOfWeek;

    @Column(name = "days_of_month")
    private String daysOfMonth;

    @Column(name = "times_of_day")
    private String timesOfDay;

    @Column(name = "start_at")
    private LocalDateTime startAt;

    @Column(name = "end_at")
    private LocalDateTime endAt;
}
