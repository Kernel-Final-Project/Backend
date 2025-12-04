package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.content.repository.AiContentRepository;
import com.ocp.ocp_finalproject.crawling.domain.ProductCrawl;
import com.ocp.ocp_finalproject.crawling.repository.ProductCrawlRepository;
import com.ocp.ocp_finalproject.message.content.dto.ContentGenerateRequest;
import com.ocp.ocp_finalproject.message.content.dto.ContentGenerateRequest.ProductInfo;
import com.ocp.ocp_finalproject.message.content.dto.ContentGenerateRequest.TrendCategory;
import com.ocp.ocp_finalproject.message.content.dto.ContentGenerateRequest.WebhookUrls;
import com.ocp.ocp_finalproject.work.config.ContentGenerateProperties;
import com.ocp.ocp_finalproject.work.config.KeywordSelectProperties;
import com.ocp.ocp_finalproject.work.config.ProductSelectProperties;
import com.ocp.ocp_finalproject.work.domain.Work;
import com.ocp.ocp_finalproject.work.enums.WorkExecutionStatus;
import com.ocp.ocp_finalproject.work.repository.WorkRepository;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ContentGenerateService {

    private static final int RECENT_KEYWORD_LIMIT = 10;
    private static final Set<String> SUPPORTED_CRAWL_DOMAINS = Set.of("gmarket", "musinsa", "ssadagu");

    private final WorkflowRepository workflowRepository;
    private final WorkRepository workRepository;
    private final AiContentRepository aiContentRepository;
    private final ProductCrawlRepository productCrawlRepository;
    private final KeywordSelectProperties keywordSelectProperties;
    private final ProductSelectProperties productSelectProperties;
    private final ContentGenerateProperties contentGenerateProperties;

    public ContentGenerateRequest createRequest(Long workflowId) {
        Workflow workflow = workflowRepository.findById(workflowId)
                .orElseThrow(() -> new CustomException(ErrorCode.WORKFLOW_NOT_FOUND));

        Work work = workRepository.save(
                Work.createBuilder()
                        .workflow(workflow)
                        .status(WorkExecutionStatus.PENDING)
                        .startedAt(LocalDateTime.now())
                        .completedAt(null)
                        .build()
        );

        ContentGenerateRequest request = new ContentGenerateRequest();
        request.setWorkId(work.getId());
        request.setSiteUrl(workflow.getSiteUrl());
        request.setTrendCategory(convertTrendCategory(workflow));

        request.setRecentTrendKeywords(fetchRecentTrendKeywords(workflow.getId()));

        List<ProductInfo> crawledProducts = fetchCrawledProducts(workflow);
        boolean hasCrawled = !crawledProducts.isEmpty();
        request.setHasCrawledItems(hasCrawled);
        request.setCrawledProducts(hasCrawled ? crawledProducts : null);

        request.setRecentlyUsedProducts(hasCrawled ? null : fetchRecentlyUsedProducts(workflow.getId()));

        return request;
    }

    public ContentGenerateRequest applyWebhookSettings(ContentGenerateRequest request) {
        request.setWebhookSecret(contentGenerateProperties.getWebhookSecret());
        WebhookUrls webhookUrls = new WebhookUrls();
        webhookUrls.setKeywordSelect(keywordSelectProperties.getWebhookUrl());
        webhookUrls.setProductSelect(productSelectProperties.getWebhookUrl());
        webhookUrls.setContentGenerate(contentGenerateProperties.getWebhookUrl());
        request.setWebhookUrls(webhookUrls);
        return request;
    }

    private List<String> fetchRecentTrendKeywords(Long workflowId) {
        List<String> keywords = aiContentRepository.findRecentTrendKeywordsByWorkflowId(
                workflowId,
                PageRequest.of(0, RECENT_KEYWORD_LIMIT)
        );
        return keywords.isEmpty() ? Collections.emptyList() : keywords;
    }

    private List<String> fetchRecentlyUsedProducts(Long workflowId) {
        List<String> products = aiContentRepository.findRecentChoiceProductsByWorkflowId(workflowId);
        return products.isEmpty() ? Collections.emptyList() : products;
    }

    private List<ProductInfo> fetchCrawledProducts(Workflow workflow) {
        if (!supportsCrawling(workflow.getSiteUrl())) {
            return Collections.emptyList();
        }
        return productCrawlRepository.findByWorkflowId(workflow.getId()).stream()
                .map(this::toProductInfo)
                .collect(Collectors.toList());
    }

    private boolean supportsCrawling(String siteUrl) {
        if (siteUrl == null || siteUrl.isBlank()) {
            return false;
        }
        try {
            String host = new URI(siteUrl).getHost();
            if (host == null) {
                return false;
            }
            String lowerHost = host.toLowerCase(Locale.ROOT);
            return SUPPORTED_CRAWL_DOMAINS.stream().anyMatch(lowerHost::contains);
        } catch (URISyntaxException e) {
            return false;
        }
    }

    private ProductInfo toProductInfo(ProductCrawl productCrawl) {
        ProductInfo info = new ProductInfo();
        info.setProductId(productCrawl.getId());
        info.setName(productCrawl.getProductName());
        info.setPrice(productCrawl.getProductPrice() != null ? String.valueOf(productCrawl.getProductPrice()) : null);
        info.setImageUrl(null);
        info.setProductUrl(productCrawl.getProductDetailUrl());
        return info;
    }

    private TrendCategory convertTrendCategory(Workflow workflow) {
        TrendCategory category = new TrendCategory();
        if (workflow.getTrendCategory() != null) {
            List<com.ocp.ocp_finalproject.trend.domain.TrendCategory> path = workflow.getTrendCategory().getFullPath();
            if (path.size() > 0) {
                category.setCategory1(path.get(0).getTrendCategoryName());
            }
            if (path.size() > 1) {
                category.setCategory2(path.get(1).getTrendCategoryName());
            }
            if (path.size() > 2) {
                category.setCategory3(path.get(2).getTrendCategoryName());
            }
        }
        return category;
    }
}
