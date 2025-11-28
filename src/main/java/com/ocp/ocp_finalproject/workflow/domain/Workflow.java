package com.ocp.ocp_finalproject.workflow.domain;

import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.crawling.domain.SiteUrlInfo;
import com.ocp.ocp_finalproject.trend.domain.SetTrendCategory;
import com.ocp.ocp_finalproject.user.domain.User;
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

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "site_url_info_id")
    private SiteUrlInfo siteUrlInfo;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_blog_id")
    private UserBlog userBlog;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "set_trend_category_id")
    private SetTrendCategory setTrendCategory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "recurrence_rule_id")
    private RecurrenceRule recurrenceRule;

    @OneToMany(mappedBy = "workflow", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Work> works = new ArrayList<>();

    @Column(name = "is_test", nullable = false)
    private Boolean isTest = false;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 50)
    private WorkflowStatus status;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = true;

    @Builder(builderMethodName = "createBuilder")
    public static Workflow create(
            User user,
            SiteUrlInfo siteUrlInfo,
            UserBlog userBlog,
            SetTrendCategory setTrendCategory,
            RecurrenceRule recurrenceRule,
            WorkflowStatus status,
            Boolean isTest,
            Boolean isActive
    ) {
        Workflow workflow = new Workflow();
        workflow.user = user;
        workflow.siteUrlInfo = siteUrlInfo;
        workflow.userBlog = userBlog;
        workflow.setTrendCategory = setTrendCategory;
        workflow.recurrenceRule = recurrenceRule;

        workflow.status = status;
        workflow.isTest = isTest != null ? isTest : false;
        workflow.isActive = isActive != null ? isActive : true;

        return workflow;
    }

}
