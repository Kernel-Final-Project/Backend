package com.ocp.ocp_finalproject.crawling.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import static lombok.AccessLevel.PROTECTED;

@Entity
@Getter
@NoArgsConstructor(access = PROTECTED)
public class SiteUrlInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 1000, nullable = false)
    private String siteUrl;

    @Column(nullable = false)
    private String siteName;

    // 생성 메서드(생성 규칙을 검증할 때 있으면 좋음)
    public static SiteUrlInfo of(String siteUrl, String siteName) {
        SiteUrlInfo info = new SiteUrlInfo();
        info.siteUrl = siteUrl;
        info.siteName = siteName;
        return info;
    }
}
