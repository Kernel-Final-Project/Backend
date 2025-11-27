package com.ocp.ocp_finalproject.crawling.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "product_crawl")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ProductCrawl extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_crawl_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "site_url_info_id", nullable = false)
    private SiteUrlInfo siteUrlInfo;

    @Column(name = "product_name", length = 100, nullable = false)
    private String productName;

    @Column(name = "product_code", length = 100, nullable = false)
    private String productCode;

    @Column(name = "product_detail_url", length = 1000, nullable = false)
    private String productDetailUrl;

    @Column(name = "product_price", length = 10)
    // DB에서 NULL이 들어올 수 있으면 primitive 타입 사용하면 NPE 위험해서 Integer 사용
    private Integer productPrice;

    @Column(name = "started_at")
    private LocalDateTime startedAt;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @Builder(builderMethodName = "createBuilder")
    public static ProductCrawl create(SiteUrlInfo siteUrlInfo, String productName, String productCode, String productDetailUrl, Integer productPrice, LocalDateTime startedAt, LocalDateTime completedAt) {
        ProductCrawl crawl = new ProductCrawl();
        crawl.siteUrlInfo = siteUrlInfo;
        crawl.productName = productName;
        crawl.productCode = productCode;
        crawl.productDetailUrl = productDetailUrl;
        crawl.productPrice = productPrice;
        crawl.startedAt = startedAt;
        crawl.completedAt = completedAt;
        return crawl;
    }
}
