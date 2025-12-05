package com.ocp.ocp_finalproject.work.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ContentGenerateWebhookRequest {

    @JsonProperty("workId")
    private Long workId;

    private String title;
    private String content;
    private String summary;
}
