package com.ocp.ocp_finalproject.crawling.domain;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ProductCrawl {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "site_url_info_id", nullable = false)
    private SiteUrlInfo siteUrlInfo;

    @Column(length = 100, nullable = false)
    private String productName;

    @Column(length = 100, nullable = false)
    private String productCode;

    @Column(length = 1000, nullable = false)
    private String productDetailUrl;

    @Column(length = 10)
    // DB에서 NULL이 들어올 수 있으면 primitive 타입 사용하면 NPE 위험해서 Integer 사용
    private Integer productPrice;

    @Column
    private LocalDateTime startedAt;

    @Column
    private LocalDateTime completedAt;

    public static ProductCrawl of(SiteUrlInfo siteUrlInfo, String productName, String productCode, String productDetailUrl, Integer productPrice) {
        ProductCrawl crawl = new ProductCrawl();
        crawl.siteUrlInfo = siteUrlInfo;
        crawl.productName = productName;
        crawl.productCode = productCode;
        crawl.productDetailUrl = productDetailUrl;
        crawl.productPrice = productPrice;
        return crawl;
    }
}
