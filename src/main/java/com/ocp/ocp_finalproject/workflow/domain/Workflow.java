package com.ocp.ocp_finalproject.workflow.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "workflow")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Workflow extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "workflow_id")
    private Long workflowId;

    @OneToMany(mappedBy = "workflow", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Work> works = new ArrayList<>();

    @OneToMany(mappedBy = "workflow", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RecurrenceRule> recurrenceRules = new ArrayList<>();

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "user_id")
//    private User user;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "site_url_id")
//    private SiteUrlInfo siteUrlInfo;

//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "user_blog_id")
//    private UserBlog userBlog;

//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "trend_keyword_id")
//    private SetTrendKeyword setTrendKeyword;

//    @OneToMany(mappedBy = "dailyStatistics", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<DailyStatistics> dailyStatistics = new ArrayList<>();

    @Column(name = "is_test")
    private Boolean isTest = false;

    @Enumerated(EnumType.STRING)
    private WorkflowStatus status;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

}
