package com.ocp.ocp_finalproject.work.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductSelectWebhookRequest {

    @JsonProperty("workId")
    private Long workId;

    private Product product;

    @Getter
    @Setter
    @NoArgsConstructor
    public static class Product {
        private String productCode;
        private String productName;
        private String productPrice;
        private String imageUrl;
        private String productUrl;
        private String mall;
    }
}
