package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.blog.domain.BlogType;
import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import com.ocp.ocp_finalproject.blog.repository.BlogTypeRepository;
import com.ocp.ocp_finalproject.blog.repository.UserBlogRepository;
import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.trend.domain.TrendCategory;
import com.ocp.ocp_finalproject.trend.repository.TrendCategoryRepository;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.repository.UserRepository;
import com.ocp.ocp_finalproject.workflow.domain.*;
import com.ocp.ocp_finalproject.workflow.dto.*;
import com.ocp.ocp_finalproject.workflow.dto.request.*;
import com.ocp.ocp_finalproject.workflow.dto.response.*;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import com.ocp.ocp_finalproject.workflow.validator.RecurrenceRuleValidator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class WorkflowServiceImpl implements WorkflowService {

    private final UserRepository userRepository;
    private final WorkflowRepository workflowRepository;
    private final TrendCategoryRepository trendCategoryRepository;
    private final BlogTypeRepository blogTypeRepository;
    private final PasswordEncoder passwordEncoder;
    private final UserBlogRepository userBlogRepository;
    private final RecurrenceRuleValidator validator;

    @Override
    @Transactional(readOnly = true)
    public List<WorkflowListResponse> findWorkflows(Long userId) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(USER_NOT_FOUND));

        return workflowRepository.findWorkflows(user.getId());
    }

    @Override
    @Transactional(readOnly = true)
    public WorkflowEditResponse findWorkflow(Long workflowId, Long userId) {

        Workflow workflow = workflowRepository.findWorkflow(workflowId, userId)
                .orElseThrow(() -> new CustomException(WORKFLOW_NOT_FOUND));

        User user = workflow.getUser();

        UserBlog userBlog = workflow.getUserBlog();

        BlogType blogType = userBlog.getBlogType();

        TrendCategory category = trendCategoryRepository.findCategoryWithParent(workflow.getTrendCategory().getId())
                .orElseThrow(() -> new CustomException(TREND_NOT_FOUND));

        RecurrenceRule rule = workflow.getRecurrenceRule();

        return WorkflowEditResponse.builder()
                .workflowId(workflow.getId())
                .userId(user.getId())
                .siteUrl(workflow.getSiteUrl())
                .blogTypeId(blogType.getId())
                .blogUrl(userBlog.getBlogUrl())
                .setTrendCategory(SetTrendCategoryDto.from(category))
                .blogAccountId(userBlog.getAccountId())
                .recurrenceRule(RecurrenceRuleDto.from(rule))
                .build();
    }

    @Override
    @Transactional
    public WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(USER_NOT_FOUND));

        BlogType blogType = blogTypeRepository.findById(workflowRequest.getBlogTypeId())
                .orElseThrow(() -> new CustomException(BLOG_TYPE_NOT_FOUND));

        TrendCategory category = trendCategoryRepository.findCategoryWithParent(workflowRequest.getCategoryId())
                .orElseThrow(() -> new CustomException(TREND_NOT_FOUND));

        String encryptedPassword = passwordEncoder.encode(workflowRequest.getBlogAccountPwd());

        UserBlog userBlog = UserBlog.createBuilder()
                .blogType(blogType)
                .accountId(workflowRequest.getBlogAccountId())
                .accountPassword(encryptedPassword)
                .blogUrl(workflowRequest.getBlogUrl())
                .build();

        RecurrenceRuleDto ruleDto = workflowRequest.getRecurrenceRule();

        validator.validate(ruleDto);

        RecurrenceRule rule = RecurrenceRule.create(ruleDto.getRepeatType(),
                        ruleDto.getRepeatInterval(),
                        ruleDto.getDaysOfWeek(),
                        ruleDto.getDaysOfMonth(),
                        ruleDto.getTimesOfDay(),
                        ruleDto.getStartAt(),
                        ruleDto.getEndAt());

        Workflow workflow = Workflow.create(user, userBlog, category, rule, workflowRequest.getSiteUrl());

        workflowRepository.save(workflow);

        return buildResponse(workflow, category);
    }

    @Override
    @Transactional
    public WorkflowResponse updateWorkflow(Long userId, WorkflowEditRequest workflowEditRequest) {

        Workflow workflow = workflowRepository.findWorkflow(workflowEditRequest.getWorkflowId(), userId)
                .orElseThrow(() -> new CustomException(WORKFLOW_NOT_FOUND));

        BlogType blogType = blogTypeRepository.findById(workflowEditRequest.getBlogTypeId())
                .orElseThrow(() -> new CustomException(BLOG_TYPE_NOT_FOUND));

        UserBlog userBlog = userBlogRepository.findByBlogTypeAndAccountId(blogType, workflowEditRequest.getBlogAccountId());

        if (userBlog == null) {
            userBlog = UserBlog.create(blogType,
                    workflowEditRequest.getBlogAccountId(),
                    passwordEncoder.encode(workflowEditRequest.getBlogAccountPwd()),
                    workflowEditRequest.getBlogUrl());

            userBlogRepository.save(userBlog);
        }

        TrendCategory category = trendCategoryRepository.findCategoryWithParent(workflowEditRequest.getCategoryId())
                .orElseThrow(() -> new CustomException(TREND_NOT_FOUND));

        RecurrenceRule rule = workflow.getRecurrenceRule();

        if (rule != null) {
            RecurrenceRuleDto ruleDto = workflowEditRequest.getRecurrenceRule();

            validator.validate(ruleDto);

            rule.update(ruleDto);
        }

        workflow.update(userBlog, category, rule, workflowEditRequest.getSiteUrl());

        return buildResponse(workflow, category);
    }

    private WorkflowResponse buildResponse(
            Workflow workflow,
            TrendCategory category
    ) {
        User user = workflow.getUser();
        UserBlog userBlog = workflow.getUserBlog();
        BlogType blogType = userBlog.getBlogType();
        RecurrenceRule rule = workflow.getRecurrenceRule();

        return WorkflowResponse.builder()
                .workflowId(workflow.getId())
                .userId(user.getId())
                .siteUrl(workflow.getSiteUrl())
                .blogType(blogType.getBlogTypeName())
                .blogUrl(userBlog.getBlogUrl())
                .setTrendCategory(SetTrendCategoryDto.from(category))
                .blogAccountId(userBlog.getAccountId())
                .readableRule(rule.getReadableRule())
                .build();
    }
}