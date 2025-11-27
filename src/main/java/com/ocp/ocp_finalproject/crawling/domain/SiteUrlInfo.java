package com.ocp.ocp_finalproject.crawling.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "site_url_info")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SiteUrlInfo extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "site_url_info_id")
    private Long id;

    @Column(name = "site_url", length = 1000, nullable = false)
    private String siteUrl;

    @Column(name = "site_name", length = 200, nullable = false)
    private String siteName;

    @Builder(builderMethodName = "createBuilder")
    public static SiteUrlInfo create(String siteUrl, String siteName) {
        SiteUrlInfo info = new SiteUrlInfo();
        info.siteUrl = siteUrl;
        info.siteName = siteName;
        return info;
    }
}
