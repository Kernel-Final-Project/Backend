package com.ocp.ocp_finalproject.workflow.finder;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.repository.UserRepository;
import com.ocp.ocp_finalproject.workflow.dto.WorkflowListResponse;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.USER_NOT_FOUND;
import static com.ocp.ocp_finalproject.common.exception.ErrorCode.WORKFLOW_NOT_FOUND;

@Component
@RequiredArgsConstructor
public class WorkflowFinder {

    private final WorkflowRepository workflowRepository;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<WorkflowListResponse> findWorkflows(Long userId) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(USER_NOT_FOUND));

        List<WorkflowListResponse> workflowList = workflowRepository.findByUserId(userId);

        if (workflowList.isEmpty()) {
            throw new CustomException(WORKFLOW_NOT_FOUND);
        }

        return workflowList;
    }

}