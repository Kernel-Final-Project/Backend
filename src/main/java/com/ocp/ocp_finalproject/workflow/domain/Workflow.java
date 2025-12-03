package com.ocp.ocp_finalproject.workflow.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.trend.domain.TrendCategory;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.work.domain.Work;
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
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "user_blog_id")
    private UserBlog userBlog;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trend_category_id")
    private TrendCategory trendCategory;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "recurrence_rule_id")
    private RecurrenceRule recurrenceRule;

    @OneToMany(mappedBy = "workflow", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private List<Work> works = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 50)
    private WorkflowStatus status;

    @Column(name = "site_url", length = 100)
    private String siteUrl;

    @Column(name = "is_test", nullable = false)
    private Boolean isTest = false;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = true;

    public static Workflow create(
            User user,
            UserBlog userBlog,
            TrendCategory trendCategory,
            RecurrenceRule recurrenceRule,
            String siteUrl
    ) {
        Workflow workflow = new Workflow();
        workflow.user = user;
        workflow.userBlog = userBlog;
        workflow.trendCategory = trendCategory;
        workflow.recurrenceRule = recurrenceRule;
        workflow.status = WorkflowStatus.PENDING;
        workflow.siteUrl = siteUrl;
        workflow.isTest = false;
        workflow.isActive = true;

        return workflow;
    }

    public void update(UserBlog userBlog,
                       TrendCategory trendCategory,
                       RecurrenceRule recurrenceRule,
                       String siteUrl) {
        this.userBlog = userBlog;
        this.trendCategory = trendCategory;
        this.recurrenceRule = recurrenceRule;
        this.siteUrl = siteUrl;
    }

}