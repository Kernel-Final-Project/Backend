package com.ocp.ocp_finalproject.monitoring.service;

import com.ocp.ocp_finalproject.monitoring.dto.response.WorkInfoResponse;

public interface PostStatsService {

    WorkInfoResponse findWorkflowPosts(Long userId, Long workId);
}
