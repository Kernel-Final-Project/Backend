package com.ocp.ocp_finalproject.monitoring.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.content.domain.BlogPost;
import com.ocp.ocp_finalproject.user.domain.User;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "post_daily_stats")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PostDailyStats extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_stat_id")
    private Long postStatId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "blog_post_id", nullable = false)
    private BlogPost blogPost;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "view_count", nullable = false)
    private Integer viewCount;

    @Column(name = "stat_date")
    private LocalDate statDate;

    @Builder(builderMethodName = "createBuilder")
    public static PostDailyStats create(BlogPost blogPost,
                                        User user,
                                        Integer viewCount,
                                        LocalDate statDate) {

        PostDailyStats stats = new PostDailyStats();

        stats.blogPost = blogPost;
        stats.user = user;
        stats.viewCount = (viewCount != null ? viewCount : 0);         // 기본값 적용
        stats.statDate = (statDate != null ? statDate : LocalDate.now());

        return stats;
    }
}