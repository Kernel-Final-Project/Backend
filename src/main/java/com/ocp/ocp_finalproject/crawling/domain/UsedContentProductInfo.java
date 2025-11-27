package com.ocp.ocp_finalproject.crawling.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import static lombok.AccessLevel.PROTECTED;

@Entity
@Getter
@NoArgsConstructor(access = PROTECTED)
public class UsedContentProductInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String productName;

    @Column
    private String productCode;

    @Column(length = 1000)
    private String productDetailUrl;

    @Column
    // DB에서 NULL이 들어올 수 있으면 primitive 타입 사용하면 NPE 위험해서 Integer 사용
    private Integer productPrice;

    public static UsedContentProductInfo of(String productName, String productCode, String productDetailUrl, Integer productPrice) {
        UsedContentProductInfo usedContentProductInfo = new UsedContentProductInfo();
        usedContentProductInfo.productName = productName;
        usedContentProductInfo.productCode = productCode;
        usedContentProductInfo.productDetailUrl = productDetailUrl;
        usedContentProductInfo.productPrice = productPrice;
        return usedContentProductInfo;
    }
}
