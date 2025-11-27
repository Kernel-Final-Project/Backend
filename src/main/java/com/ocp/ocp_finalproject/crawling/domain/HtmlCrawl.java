package com.ocp.ocp_finalproject.crawling.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "html_crawl")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class HtmlCrawl extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "html_crawl_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="site_url_info_id", nullable = false)
    private SiteUrlInfo siteUrlInfo;

    @Lob
    @Column(name = "html_content", columnDefinition = "TEXT")
    private String htmlContent;

    @Column(name = "started_at")
    private LocalDateTime startedAt;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @Builder(builderMethodName = "createBuilder")
    public static HtmlCrawl create(SiteUrlInfo siteUrlInfo, String htmlContent, LocalDateTime startedAt, LocalDateTime completedAt) {
        HtmlCrawl htmlCrawl = new HtmlCrawl();
        htmlCrawl.siteUrlInfo = siteUrlInfo;
        htmlCrawl.htmlContent = htmlContent;
        htmlCrawl.startedAt = startedAt;
        htmlCrawl.completedAt = completedAt;
        return htmlCrawl;
    }
}
