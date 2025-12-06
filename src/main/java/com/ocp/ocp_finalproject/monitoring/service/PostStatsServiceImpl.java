package com.ocp.ocp_finalproject.monitoring.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.monitoring.dto.response.WorkInfoResponse;
import com.ocp.ocp_finalproject.user.repository.UserRepository;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.*;

@Service
@RequiredArgsConstructor
public class PostStatsServiceImpl implements PostStatsService {

    private final WorkRepository workRepository;
    private final UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public WorkInfoResponse findWorkflowPosts(Long userId, Long workId) {

        userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(USER_NOT_FOUND));

        return workRepository.findWorkflowPosts(userId);
    }
}