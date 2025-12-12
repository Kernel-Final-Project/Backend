package com.ocp.ocp_finalproject.integration.airflow;

import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

/**
 * Airflow REST API를 호출해 DAG Run을 트리거하는 간단한 클라이언트.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class AirflowTriggerClient {

    private final RestTemplate restTemplate = new RestTemplate();

    @Value("${airflow.api.base-url}")
    private String baseUrl;

    @Value("${airflow.api.username}")
    private String username;

    @Value("${airflow.api.password}")
    private String password;

    /**
     * trend_pipeline DAG를 실행하도록 Airflow에 요청한다.
     *
     * @param workflowId  실행 중인 워크플로우 ID
     */
    public void triggerTrendPipeline(Long workflowId) {
        if (!StringUtils.hasText(baseUrl)) {
            log.warn("Airflow base URL이 설정되지 않아 DAG를 트리거하지 못했습니다.");
            return;
        }

        String dagRunId = String.format("auto__%s_%d",
                workflowId != null ? workflowId : "unknown",
                Instant.now().toEpochMilli());

        Map<String, Object> conf = new HashMap<>();
        if (workflowId != null) {
            conf.put("workflowId", workflowId);
        }

        Map<String, Object> payload = new HashMap<>();
        payload.put("dag_run_id", dagRunId);
        payload.put("conf", conf);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        if (StringUtils.hasText(username) && StringUtils.hasText(password)) {
            headers.setBasicAuth(username, password);
        }

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(payload, headers);
        String endpoint = baseUrl.endsWith("/")
                ? baseUrl + "api/v1/dags/trend_pipeline/dagRuns"
                : baseUrl + "/api/v1/dags/trend_pipeline/dagRuns";
        try {
            restTemplate.postForEntity(endpoint, request, String.class);
            log.info("Airflow trend_pipeline DAG 트리거 요청 완료 dagRunId={}", dagRunId);
        } catch (RestClientException ex) {
            log.warn("Airflow DAG 트리거 실패 dagRunId={} : {}", dagRunId, ex.getMessage());
        }
    }
}
