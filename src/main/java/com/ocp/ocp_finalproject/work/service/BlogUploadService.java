package com.ocp.ocp_finalproject.work.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ocp.ocp_finalproject.blog.domain.BlogType;
import com.ocp.ocp_finalproject.blog.domain.UserBlog;
import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.content.domain.AiContent;
import com.ocp.ocp_finalproject.message.blog.dto.BlogUploadRequest;
import com.ocp.ocp_finalproject.work.config.BlogUploadProperties;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import com.ocp.ocp_finalproject.work.repository.AiContentRepository;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import com.ocp.ocp_finalproject.workflow.domain.RecurrenceRule;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class BlogUploadService {

    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm");

    private final BlogUploadProperties blogUploadProperties;
    private final WorkRepository workRepository;
    private final AiContentRepository aiContentRepository;
    private final ObjectMapper objectMapper;

    @Transactional(readOnly = true)
    public List<BlogUploadRequest> collectPendingBlogUploads() {
        List<Work> candidates = workRepository.findByStatusWithWorkflow(WorkExecutionStatus.CONTENT_GENERATED);
        if (candidates.isEmpty()) {
            return Collections.emptyList();
        }

        LocalDateTime now = LocalDateTime.now();
        List<BlogUploadRequest> requests = new ArrayList<>();

        for (Work work : candidates) {
            Workflow workflow = work.getWorkflow();
            if (!isWorkflowActive(workflow, now)) {
                continue;
            }

            Optional<AiContent> aiContentOpt = aiContentRepository.findTopByWorkId(work.getId());
            if (aiContentOpt.isEmpty()) {
                log.warn("워크 {} 에 대한 AI 콘텐츠를 찾을 수 없어 업로드를 건너뜁니다.", work.getId());
                continue;
            }

            UserBlog userBlog = workflow.getUserBlog();
            if (userBlog == null) {
                log.warn("워크 {} 의 워크플로우에 블로그 정보가 없어 업로드를 건너뜁니다.", work.getId());
                continue;
            }

            AiContent aiContent = aiContentOpt.get();
            BlogUploadRequest request = new BlogUploadRequest();
            request.setWorkId(work.getId());
            request.setTitle(aiContent.getTitle());
            request.setContent(aiContent.getContent());
            request.setBlogType(resolveBlogType(userBlog.getBlogType()));
            request.setBlogId(userBlog.getAccountId());
            request.setBlogPassword(userBlog.getAccountPassword());
            request.setBlogUrl(userBlog.getBlogUrl());

            requests.add(request);
        }

        return requests;
    }

    public BlogUploadRequest prepareBlogUploadRequest(BlogUploadRequest request) {
        applyDefaultWebhookUrlIfNeeded(request);
        applyWebhookToken(request);
        return request;
    }

    private boolean isWorkflowActive(Workflow workflow, LocalDateTime now) {
        if (workflow == null) {
            return false;
        }
        if (Boolean.FALSE.equals(workflow.getIsActive())) {
            return false;
        }
        RecurrenceRule rule = workflow.getRecurrenceRule();
        if (rule == null) {
            return true;
        }

        if (rule.getStartAt() != null && now.isBefore(rule.getStartAt())) {
            return false;
        }
        if (rule.getEndAt() != null && now.isAfter(rule.getEndAt())) {
            return false;
        }

        if (!matchesDaysOfWeek(rule.getDaysOfWeek(), now.getDayOfWeek())) {
            return false;
        }
        if (!matchesDaysOfMonth(rule.getDaysOfMonth(), now.toLocalDate())) {
            return false;
        }
        return matchesTimesOfDay(rule.getTimesOfDay(), now.toLocalTime());
    }

    private boolean matchesDaysOfWeek(String daysOfWeekJson, DayOfWeek currentDay) {
        List<String> dayTokens = parseStringArray(daysOfWeekJson);
        if (dayTokens.isEmpty()) {
            return true;
        }
        for (String token : dayTokens) {
            try {
                if (DayOfWeek.valueOf(token.toUpperCase()) == currentDay) {
                    return true;
                }
            } catch (IllegalArgumentException ignored) {
                // 무시하고 다음 토큰 검사
            }
        }
        return false;
    }

    private boolean matchesDaysOfMonth(String daysOfMonthJson, LocalDate date) {
        List<Integer> days = parseIntegerArray(daysOfMonthJson);
        if (days.isEmpty()) {
            return true;
        }
        return days.contains(date.getDayOfMonth());
    }

    private boolean matchesTimesOfDay(String timesOfDayJson, LocalTime currentTime) {
        List<String> times = parseStringArray(timesOfDayJson);
        if (times.isEmpty()) {
            return true;
        }
        LocalTime current = currentTime.withSecond(0).withNano(0);
        for (String timeValue : times) {
            try {
                LocalTime scheduled = LocalTime.parse(timeValue, TIME_FORMATTER);
                if (scheduled.equals(current)) {
                    return true;
                }
            } catch (Exception e) {
                log.warn("잘못된 timesOfDay 값({}) 으로 인해 비교를 건너뜁니다.", timeValue);
            }
        }
        return false;
    }

    private List<String> parseStringArray(String jsonArray) {
        if (jsonArray == null || jsonArray.isBlank()) {
            return Collections.emptyList();
        }
        try {
            return objectMapper.readValue(jsonArray, new TypeReference<List<String>>() {});
        } catch (Exception e) {
            log.warn("문자열 배열 파싱 실패: {}", jsonArray, e);
            return Collections.emptyList();
        }
    }

    private List<Integer> parseIntegerArray(String jsonArray) {
        if (jsonArray == null || jsonArray.isBlank()) {
            return Collections.emptyList();
        }
        try {
            return objectMapper.readValue(jsonArray, new TypeReference<List<Integer>>() {});
        } catch (Exception e) {
            log.warn("정수 배열 파싱 실패: {}", jsonArray, e);
            return Collections.emptyList();
        }
    }

    private String resolveBlogType(BlogType blogType) {
        if (blogType == null || blogType.getBlogTypeName() == null) {
            return "unknown";
        }
        String normalized = blogType.getBlogTypeName().trim().toLowerCase();
        if (normalized.contains("naver") || normalized.contains("네이버")) {
            return "naver";
        }
        if (normalized.contains("tistory") || normalized.contains("티스토리")) {
            return "tistory";
        }
        return normalized.replace(" ", "");
    }

    private void applyWebhookToken(BlogUploadRequest request) {
        String secret = blogUploadProperties.getWebhookSecret();
        if (secret == null || secret.isBlank()) {
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID, "웹훅 시크릿이 설정되지 않았습니다.");
        }
        request.setWebhookToken(secret);
    }

    private void applyDefaultWebhookUrlIfNeeded(BlogUploadRequest request) {
        if (request.getWebhookUrl() != null && !request.getWebhookUrl().isBlank()) {
            return;
        }

        String defaultWebhookUrl = blogUploadProperties.getWebhookUrl();
        if (defaultWebhookUrl == null || defaultWebhookUrl.isBlank()) {
            throw new CustomException(ErrorCode.WORK_WEBHOOK_URL_NOT_CONFIGURED, "웹훅 URL이 설정되지 않았습니다.");
        }
        request.setWebhookUrl(defaultWebhookUrl);
    }
}
