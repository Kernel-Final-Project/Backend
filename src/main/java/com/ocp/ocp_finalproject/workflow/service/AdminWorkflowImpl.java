package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.user.repository.UserRepository;
import com.ocp.ocp_finalproject.workflow.dto.response.AdminWorkflowListResponse;
import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.domain.UserPrincipal;
import com.ocp.ocp_finalproject.user.enums.UserRole;
import com.ocp.ocp_finalproject.workflow.dto.response.WorkflowListResponse;
import com.ocp.ocp_finalproject.workflow.enums.SiteUrlInfo;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.*;
import static org.springframework.beans.support.PagedListHolder.DEFAULT_PAGE_SIZE;

@Service
@RequiredArgsConstructor
public class AdminWorkflowImpl implements AdminWorkflowService {

    private final WorkflowRepository workflowRepository;

    private final UserRepository userRepository;

    public Page<AdminWorkflowListResponse> getWorkflows(UserPrincipal principal, int page) {

        User user = validateAndGetUser(principal);

        PageRequest pageable = PageRequest.of(page, DEFAULT_PAGE_SIZE, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<AdminWorkflowListResponse> workflows = workflowRepository.findWorkflowsForAdmin(user.getId(), pageable);

        return workflows.map(wf -> AdminWorkflowListResponse.builder()
                .workflowId(wf.getWorkflowId())
                .userId(wf.getUserId())
                .siteUrl(wf.getSiteUrl())
                .siteName(SiteUrlInfo.getSiteNameFromUrl(wf.getSiteUrl()))
                .trendCategoryName(wf.getTrendCategoryName())
                .blogType(wf.getBlogType())
                .blogAccountId(wf.getBlogAccountId())
                .blogUrl(wf.getBlogUrl())
                .readableRule(wf.getReadableRule())
                .status(wf.getStatus())
                .build());
    }

    private User validateAndGetUser(UserPrincipal principal) {
        if (principal == null || principal.getUser() == null) {
            throw new CustomException(UNAUTHORIZED);
        }

        User user = userRepository.findById(principal.getUser().getId())
                .orElseThrow(() -> new CustomException(USER_NOT_FOUND));

        if(user.getRole() != UserRole.ADMIN) {
            throw new CustomException(ACCESS_DENIED);
        }

        return user;
    }

}
