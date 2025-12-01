package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.blog.domain.BlogType;
import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import com.ocp.ocp_finalproject.blog.repository.BlogTypeRepository;
import com.ocp.ocp_finalproject.blog.repository.UserBlogRepository;
import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.trend.domain.TrendCategory;
import com.ocp.ocp_finalproject.trend.repository.TrendCategoryRepository;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.workflow.domain.RecurrenceRule;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.dto.*;
import com.ocp.ocp_finalproject.workflow.enums.WorkflowStatus;
import com.ocp.ocp_finalproject.workflow.finder.WorkflowFinder;
import com.ocp.ocp_finalproject.workflow.repository.RecurrenceRuleRepository;
import com.ocp.ocp_finalproject.workflow.repository.UserRepository;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import com.ocp.ocp_finalproject.workflow.util.RecurrenceRuleFormatter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

import static com.ocp.ocp_finalproject.common.exception.ErrorCode.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class WorkflowServiceImpl implements WorkflowService {

    private final WorkflowFinder workflowFinder;
    private final UserRepository userRepository;
    private final WorkflowRepository workflowRepository;
    private final TrendCategoryRepository trendCategoryRepository;
    private final BlogTypeRepository blogTypeRepository;

    @Override
    public List<WorkflowListResponse> findWorkflows(Long userId) {

        return workflowFinder.findWorkflows(userId);
    }

    @Override
    @Transactional
    public WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(USER_NOT_FOUND));

        BlogType blogType = blogTypeRepository.findById(workflowRequest.getBlogTypeId())
                .orElseThrow(() -> new CustomException(BLOG_NOT_FOUND));

        TrendCategory category = trendCategoryRepository.findCategoryWithParent(workflowRequest.getCategoryId())
                .orElseThrow(() -> new CustomException(TREND_NOT_FOUND));

        UserBlog userBlog = createUserBlog(workflowRequest, blogType);

        RecurrenceRule rule = createRule(workflowRequest);

        Workflow workflow = Workflow.createBuilder()
                .user(user)
                .userBlog(userBlog)
                .trendCategory(category)
                .recurrenceRule(rule)
                .siteUrl(workflowRequest.getSiteUrl())
                .build();

        workflowRepository.save(workflow);

        return buildResponse(workflow, user, blogType, category, userBlog, rule);
    }

    private UserBlog createUserBlog(WorkflowRequest workflowRequest, BlogType blogType) {
        return UserBlog.createBuilder()
                .blogType(blogType)
                .accountId(workflowRequest.getBlogAccountId())
                .accountPassword(workflowRequest.getBlogAccountPwd())
                .blogUrl(workflowRequest.getBlogUrl())
                .build();
    }

    private RecurrenceRule createRule(WorkflowRequest workflowRequest) {
        RecurrenceRuleDto ruleDto = workflowRequest.getRecurrenceRule();

        String readableRule = RecurrenceRuleFormatter.toReadableString(ruleDto);

        return RecurrenceRule.createBuilder()
                .repeatType(ruleDto.getRepeatType())
                .repeatInterval(ruleDto.getRepeatInterval())
                .daysOfWeek(ruleDto.getDaysOfWeekAsString())
                .daysOfMonth(ruleDto.getDaysOfMonthAsString())
                .timesOfDay(ruleDto.getTimesOfDayAsString())
                .readableRule(readableRule)
                .startAt(ruleDto.getStartAt())
                .endAt(ruleDto.getEndAt())
                .build();
    }

    private WorkflowResponse buildResponse(
            Workflow workflow,
            User user,
            BlogType blogType,
            TrendCategory category,
            UserBlog userBlog,
            RecurrenceRule rule
    ) {

        List<TrendCategory> path = category.getFullPath(category);

        return WorkflowResponse.builder()
                .workflowId(workflow.getId())
                .userId(user.getId())
                .siteUrl(workflow.getSiteUrl())
                .blogType(blogType.getBlogTypeName())
                .blogUrl(userBlog.getBlogUrl())
                .setTrendCategory(SetTrendCategoryDto.from(path))
                .blogAccountId(userBlog.getAccountId())
                .readableRule(rule.getReadableRule())
                .build();
    }
}