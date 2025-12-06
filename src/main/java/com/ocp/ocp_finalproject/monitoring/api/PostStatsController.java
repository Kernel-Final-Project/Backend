package com.ocp.ocp_finalproject.monitoring.api;

import com.ocp.ocp_finalproject.common.response.ApiResult;
import com.ocp.ocp_finalproject.monitoring.dto.response.WorkInfoResponse;
import com.ocp.ocp_finalproject.monitoring.service.PostStatsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/post")
public class PostStatsController {

    private final PostStatsService postStatsService;


    @GetMapping("/view-count/{userId}/{workId}")
    public ResponseEntity<ApiResult<WorkInfoResponse>> getWorkflowPosts(@PathVariable Long userId,
                                                                        @PathVariable Long workId) {

        WorkInfoResponse workflowPosts = postStatsService.findWorkflowPosts(userId, workId);

        return ResponseEntity.ok(ApiResult.success("워크 조회수 조회 성공", workflowPosts));
    }
}