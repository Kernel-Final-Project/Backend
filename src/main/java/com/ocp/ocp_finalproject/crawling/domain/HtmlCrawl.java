package com.ocp.ocp_finalproject.crawling.domain;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class HtmlCrawl {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="site_url_info_id", nullable = false)
    private SiteUrlInfo siteUrlInfo;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String htmlContent;

    @Column
    private LocalDateTime startedAt;

    @Column
    private LocalDateTime completedAt;

    public static HtmlCrawl of(String htmlContent, LocalDateTime startedAt, LocalDateTime completedAt) {
        HtmlCrawl htmlCrawl = new HtmlCrawl();
        htmlCrawl.htmlContent = htmlContent;
        htmlCrawl.startedAt = startedAt;
        htmlCrawl.completedAt = completedAt;
        return htmlCrawl;
    }
}
