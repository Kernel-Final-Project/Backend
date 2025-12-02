package com.ocp.ocp_finalproject.workflow.service;

import com.ocp.ocp_finalproject.blog.domain.BlogType;
import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import com.ocp.ocp_finalproject.blog.repository.BlogTypeRepository;
import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.scheduler.service.SchedulerSyncService;
import com.ocp.ocp_finalproject.trend.domain.TrendCategory;
import com.ocp.ocp_finalproject.trend.repository.TrendCategoryRepository;
import com.ocp.ocp_finalproject.user.domain.User;
import com.ocp.ocp_finalproject.user.repository.UserRepository;
import com.ocp.ocp_finalproject.workflow.domain.RecurrenceRule;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.dto.*;
import com.ocp.ocp_finalproject.workflow.finder.WorkflowFinder;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import com.ocp.ocp_finalproject.workflow.util.RecurrenceRuleFormatter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
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
    private final SchedulerSyncService schedulerSyncService;

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

        Workflow workflow = workflowRepository.findWorkflow(workflowId, userId);

        User user = workflow.getUser();

        UserBlog userBlog = workflow.getUserBlog();

        BlogType blogType = userBlog.getBlogType();

        TrendCategory category = workflow.getTrendCategory();

        RecurrenceRule rule = workflow.getRecurrenceRule();

        List<TrendCategory> path = category.getFullPath();

        return WorkflowEditResponse.builder()
                .workflowId(workflow.getId())
                .userId(user.getId())
                .siteUrl(workflow.getSiteUrl())
                .blogTypeId(blogType.getId())
                .blogUrl(userBlog.getBlogUrl())
                .setTrendCategory(SetTrendCategoryDto.from(path))
                .blogAccountId(userBlog.getAccountId())
                .recurrenceRule(RecurrenceRuleDto.from(rule))
                .build();
    }

    @Override
    @Transactional
    public WorkflowResponse createWorkflow(Long userId, WorkflowRequest workflowRequest) throws SchedulerException {

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
        
        // 스케줄러에 workflow 등록
        schedulerSyncService.registerWorkflowJobs(workflow);

        return buildResponse(workflow, user, blogType, category, userBlog, rule);
    }


    /**
     *  워크플로우 수정 api 개발 시 해당 로직을 삽입해주세요.
     * public Workflow updateWorkflow(Long id, UpdateDto dto) {
     *     workflow.update(entity);
     *     schedulerSyncService.updateWorkflowJobs(workflow); <--- 이 부분 추가
     *     return workflow;
     * }
     *
     * 워크플로우 삭제 api 개발 시 해당 로직을 삽입해주세요.
     * public void deleteWorkflow(Long id) {
     *     schedulerSyncService.removeWorkflowJobs(id); <--- 이 부분 추가
     *     workflowRepository.deleteById(id);
     * }
     */

    private UserBlog createUserBlog(WorkflowRequest workflowRequest, BlogType blogType) {

        String encryptedPassword = passwordEncoder.encode(workflowRequest.getBlogAccountPwd());

        return UserBlog.createBuilder()
                .blogType(blogType)
                .accountId(workflowRequest.getBlogAccountId())
                .accountPassword(encryptedPassword)
                .blogUrl(workflowRequest.getBlogUrl())
                .build();
    }

    private RecurrenceRule createRule(WorkflowRequest workflowRequest) {
        RecurrenceRuleDto ruleDto = workflowRequest.getRecurrenceRule();

        String readableRule = RecurrenceRuleFormatter.toReadableString(ruleDto);

        return RecurrenceRule.createBuilder()
                .repeatType(ruleDto.getRepeatType())
                .repeatInterval(ruleDto.getRepeatInterval())
                .daysOfWeek(ruleDto.getDaysOfWeek())
                .daysOfMonth(ruleDto.getDaysOfMonth())
                .timesOfDay(ruleDto.getTimesOfDay())
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

        List<TrendCategory> path = category.getFullPath();

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