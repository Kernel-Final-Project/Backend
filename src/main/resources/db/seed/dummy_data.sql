-- ============================================
-- 1. 사용자 (user)
-- ============================================
INSERT INTO `user` (`user_id`, `name`, `email`, `status`, `role`, `created_at`, `updated_at`)
VALUES (1, '김철수', 'user@example.com', 'ACTIVE', 'USER', NOW(), NOW()),
       (2, '관리자', 'admin@example.com', 'ACTIVE', 'ADMIN', NOW(), NOW());

-- ============================================
-- 2. 인증 정보 (auth)
-- ============================================
INSERT INTO `auth` (`auth_id`, `user_id`, `provider`, `provider_user_id`,
                    `last_login_at`, `created_at`, `updated_at`)
VALUES (1, 1, 'KAKAO', 'kakao_123456', NOW(), NOW(), NOW()),
       (2, 2, 'GOOGLE', 'google_admin', NOW(), NOW(), NOW());

-- ============================================
-- 3. 블로그 타입 (blog_type)
-- ============================================
INSERT INTO `blog_type` (`blog_type_id`, `blog_type_name`, `blog_base_url`, `created_at`, `updated_at`)
VALUES (1, '네이버 블로그', 'https://blog.naver.com', NOW(), NOW()),
       (2, '티스토리', 'https://tistory.com', NOW(), NOW());

-- ============================================
-- 4. 사용자 블로그 (user_blog)
-- ============================================
INSERT INTO `user_blog` (`user_blog_id`, `blog_type_id`, `account_id`, `account_pw`, `blog_url`, `created_at`,
                         `updated_at`)
VALUES (1, 1, 'user123', 'password123', 'https://blog.naver.com/user123', NOW(), NOW()),
       (2, 2, 'admin_blog', 'admin_pw123', 'https://admin.tistory.com', NOW(), NOW());

-- ============================================
-- 5. 사이트 URL 정보 (site_url_info)
-- ============================================
INSERT INTO `site_url_info` (`site_url_info_id`, `site_url`, `site_name`, `created_at`, `updated_at`)
VALUES (1, 'https://www.coupang.com', '쿠팡', NOW(), NOW()),
       (2, 'https://www.11st.co.kr', '11번가', NOW(), NOW());

-- ============================================
-- 6. 트렌드 카테고리 (trend_category)
-- ============================================
INSERT INTO `trend_category` (`trend_category_id`, `parent_category_id`, `trend_category_name`, `depth`, `created_at`,
                              `updated_at`)
VALUES (1, NULL, '패션/뷰티', 1, NOW(), NOW()),
       (2, NULL, '디지털/가전', 1, NOW(), NOW()),
       (3, 1, '여성패션', 2, NOW(), NOW()),
       (4, 2, '스마트폰', 2, NOW(), NOW()),
       (5, 3, '원피스', 3, NOW(), NOW()),
       (6, 4, '갤럭시', 3, NOW(), NOW());

-- ============================================
-- 7. 설정 트렌드 카테고리 (set_trend_category)
-- ============================================
INSERT INTO `set_trend_category` (`set_trend_category_id`, `depth1_category_id`, `depth2_category_id`,
                                  `depth3_category_id`, `created_at`, `updated_at`)
VALUES (1, 1, 3, 5, NOW(), NOW()),
       (2, 2, 4, 6, NOW(), NOW());

-- ============================================
-- 8. 반복 규칙 (recurrence_rule)
-- ============================================
INSERT INTO `recurrence_rule` (`recurrence_rule_id`, `repeat_type`, `repeat_interval`, `days_of_week`,
                               `days_of_month`, `times_of_day`, `readable_rule`, `start_at`, `end_at`, `created_at`,
                               `updated_at`)
VALUES
-- DAILY (요일 없음 → NULL)
(1, 'DAILY', 1, NULL, NULL, '["09:00", "18:00"]', '매일 09:00, 18:00에 실행',
 NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR), NOW(), NOW()),

-- WEEKLY (월,수,금 → 1,3,5)
(2, 'WEEKLY', 1, '[1,3,5]', NULL, '["10:00"]', '매주 월, 수, 금요일 10:00에 실행',
 NOW(), DATE_ADD(NOW(), INTERVAL 6 MONTH), NOW(), NOW());

-- ============================================
-- 9. 워크플로우 (workflow)
-- ============================================
INSERT INTO `workflow` (`workflow_id`,`user_id`, `user_blog_id`, `trend_category_id`, `recurrence_rule_id`, `status`, `site_url`, `is_test`, `created_at`, `updated_at`)
VALUES
(1, 1, 1, 5, 1,
 'PENDING',          -- 엔티티 create()에서 기본값이 PENDING
 'https://example.com',
 FALSE,
 NOW(), NOW()),
(2, 2, 2, 6, 2,
 'PENDING',
 'https://example2.com',
 FALSE,
 NOW(), NOW());

-- ============================================
-- 10. 작업 (work)
-- ============================================
INSERT INTO `work` (`work_id`, `workflow_id`, `status`, `started_at`, `completed_at`, `created_at`, `updated_at`)
VALUES (1, 1, 'COMPLETED', DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), NOW(), NOW()),
       (2, 1, 'RUNNING', NOW(), NULL, NOW(), NOW()),
       (3, 2, 'COMPLETED', DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), NOW(), NOW()),
       (4, 2, 'PENDING', NOW(), NULL, NOW(), NOW());

-- ============================================
-- 11. HTML 크롤링 (html_crawl)
-- ============================================
INSERT INTO `html_crawl` (`html_crawl_id`, `site_url_info_id`, `html_content`, `status`, `started_at`, `completed_at`,
                          `created_at`, `updated_at`)
VALUES (1, 1, '<html><body><h1>쿠팡 샘플 HTML</h1></body></html>', 'COMPLETED', NOW(), NOW(), NOW(), NOW()),
       (2, 2, '<html><body><h1>11번가 샘플 HTML</h1></body></html>', 'COMPLETED', NOW(), NOW(), NOW(), NOW());

-- ============================================
-- 12. 상품 크롤링 (product_crawl)
-- ============================================
INSERT INTO `product_crawl` (`product_crawl_id`, `site_url_info_id`, `product_name`, `product_code`,
                             `product_detail_url`,
                             `product_price`, `started_at`, `completed_at`, `created_at`, `updated_at`)
VALUES (1, 1, '여름 원피스', 'PROD001', 'https://www.coupang.com/products/12345', 29900, NOW(), NOW(), NOW(), NOW()),
       (2, 1, '갤럭시 S24', 'PROD002', 'https://www.coupang.com/products/67890', 999000, NOW(), NOW(), NOW(), NOW()),
       (3, 2, '봄 원피스', 'PROD003', 'https://www.11st.co.kr/products/11111', 35000, NOW(), NOW(), NOW(), NOW()),
       (4, 2, '아이폰 15', 'PROD004', 'https://www.11st.co.kr/products/22222', 1200000, NOW(), NOW(), NOW(), NOW());

-- ============================================
-- 13. AI 콘텐츠 (ai_content)
-- ============================================
INSERT INTO `ai_content` (`ai_content_id`, `work_id`, `title`, `content`, `status`, `choice_product`,
                          `choice_trend_keyword`, `started_at`, `completed_at`, `created_at`, `updated_at`)
VALUES (1, 1, '2024 여름 원피스 추천', '올 여름 트렌디한 원피스를 소개합니다...', 'PUBLISHED', 'PROD001', '여름원피스', NOW(), NOW(), NOW(), NOW()),
       (3, 3, '갤럭시 S24 완벽 리뷰', '최신 갤럭시 S24의 모든 것을 알아봅니다...', 'PUBLISHED', 'PROD002', '갤럭시S24', NOW(), NOW(), NOW(),
        NOW());

-- ============================================
-- 14. 블로그 포스트 (blog_post)
-- ============================================
INSERT INTO `blog_post` (`blog_post_id`, `work_id`, `blog_post_url`, `status`, `created_at`, `updated_at`)
VALUES (1, 1, 'https://blog.naver.com/user123/123456', 'PUBLISHED', NOW(), NOW()),
       (3, 3, 'https://admin.tistory.com/123', 'PUBLISHED', NOW(), NOW());

-- ============================================
-- 15. 사용된 콘텐츠 상품 정보 (used_content_product_info)
-- ============================================
INSERT INTO `used_content_product_info` (`used_content_product_info_id`, `product_name`, `product_code`,
                                         `product_detail_url`, `product_price`, `created_at`, `updated_at`)
VALUES (1, '여름 원피스', 'PROD001', 'https://www.coupang.com/products/12345', 29900, NOW(), NOW()),
       (2, '갤럭시 S24', 'PROD002', 'https://www.coupang.com/products/67890', 999000, NOW(), NOW());

-- ============================================
-- 16. 작업 상세 로그 (work_detail_log)
-- ============================================
INSERT INTO `work_detail_log` (`log_id`, `work_id`, `step_number`, `step_name`, `log_data`, `status`, `log_level`,
                               `created_at`, `updated_at`)
VALUES (1, 1, 1, 'HTML 크롤링', '{"url": "https://www.coupang.com"}', 'SUCCESS', 'INFO', NOW(), NOW()),
       (2, 1, 2, '상품 정보 추출', '{"products_found": 2}', 'SUCCESS', 'INFO', NOW(), NOW()),
       (3, 1, 3, 'AI 콘텐츠 생성', '{"title": "2024 여름 원피스 추천"}', 'SUCCESS', 'INFO', NOW(), NOW()),
       (4, 1, 4, '블로그 포스팅', '{"post_url": "https://blog.naver.com/user123/123456"}', 'SUCCESS', 'INFO', NOW(), NOW()),
       (5, 3, 1, 'HTML 크롤링', '{"url": "https://www.11st.co.kr"}', 'SUCCESS', 'INFO', NOW(), NOW()),
       (6, 3, 2, '상품 정보 추출', '{"products_found": 2}', 'SUCCESS', 'INFO', NOW(), NOW()),
       (7, 3, 3, 'AI 콘텐츠 생성', '{"title": "갤럭시 S24 완벽 리뷰"}', 'SUCCESS', 'INFO', NOW(), NOW()),
       (8, 3, 4, '블로그 포스팅', '{"post_url": "https://admin.tistory.com/123"}', 'SUCCESS', 'INFO', NOW(), NOW());

-- ============================================
-- 17. AI 사용 로그 (ai_usage_log)
-- ============================================
INSERT INTO `ai_usage_log` (`usage_log_id`, `work_id`, `user_id`, `feature_type`, `model`, `prompt_tokens`,
                            `completion_tokens`, `total_tokens`, `estimated_cost`, `created_at`, `updated_at`)
VALUES (1, 1, 1, 'CONTENT_GENERATION', 'gpt-4', 150, 500, 650, 0.013000, NOW(), NOW()),
       (2, 3, 2, 'CONTENT_GENERATION', 'gpt-4', 200, 600, 800, 0.016000, NOW(), NOW());

-- ============================================
-- 18. 공지사항 (notice)
-- ============================================
INSERT INTO `notice` (`notice_id`, `title`, `content`, `announcement_type`, `is_important`, `author_id`, `view_count`,
                      `attachment_url`, `created_at`, `updated_at`)
VALUES (1, '서비스 오픈 안내', '안녕하세요. 서비스가 정식 오픈되었습니다.', 'GENERAL', TRUE, 2, 0, NULL, NOW(), NOW()),
       (2, '정기 점검 안내', '매주 월요일 새벽 2시~4시 정기 점검이 진행됩니다.', 'GENERAL', FALSE, 2, 0, NULL, NOW(), NOW());

-- ============================================
-- 19. 공지사항 첨부파일 (notice_file)
-- ============================================
INSERT INTO `notice_file` (`file_id`, `notice_id`, `file_name`, `original_name`, `file_url`, `file_size`, `file_type`,
                           `created_at`, `updated_at`)
VALUES (1, 1, 'service_guide.pdf', '서비스 가이드.pdf', 'https://storage.example.com/files/service_guide.pdf', 1024000,
        'application/pdf', NOW(), NOW());

-- ============================================
-- 20. 사용자 정지 (user_suspension)
-- ============================================
INSERT INTO `user_suspension` (`suspension_id`, `user_id`, `suspended_user_id`, `reason`, `suspended_at`,
                               `unsuspended_at`, `is_active`, `created_at`, `updated_at`)
VALUES (1, 2, 1, '테스트 정지 (해제됨)', DATE_SUB(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), FALSE, NOW(), NOW());

-- ============================================
-- 21. 공통 코드 그룹 (common_code_group)
-- ============================================
INSERT INTO `common_code_group` (`group_id`, `group_name`, `description`, `created_at`, `updated_at`)
VALUES (1, 'EXECUTION_STATUS', '실행 상태', NOW(), NOW()),
       (2, 'CONTENT_STATUS', 'AI 콘텐츠 생성 상태', NOW(), NOW()),
       (3, 'POST_STATUS', '블로그 포스트 발행 상태', NOW(), NOW()),
       (4, 'AUTH_PROVIDER', '인증 제공자', NOW(), NOW()),
       (5, 'USER_ROLE', '사용자 권한', NOW(), NOW()),
       (6, 'USER_STATUS', '사용자 계정 상태', NOW(), NOW()),
       (7, 'REPEAT_TYPE', '반복 유형', NOW(), NOW()),
       (8, 'WORKFLOW_STATUS', '워크플로우 상태', NOW(), NOW()),
       (9, 'LOG_LEVEL', '로그 레벨', NOW(), NOW()),
       (10, 'STEP_STATUS', '단계 실행 상태', NOW(), NOW());

-- ============================================
-- 22. 공통 코드 (common_code)
-- ============================================
INSERT INTO `common_code` (`code_id`, `group_id`, `code_name`, `description`, `sort_order`, `is_active`, `created_at`,
                           `updated_at`)
VALUES
-- EXECUTION_STATUS
('PENDING', 1, '대기', '실행 대기 중', 1, TRUE, NOW(), NOW()),
('RUNNING', 1, '실행중', '실행 중', 2, TRUE, NOW(), NOW()),
('COMPLETED', 1, '완료', '실행 완료', 3, TRUE, NOW(), NOW()),
('FAILED', 1, '실패', '실행 실패', 4, TRUE, NOW(), NOW()),
-- CONTENT_STATUS
('CONTENT_PENDING', 2, '대기', 'AI 생성 대기 중', 1, TRUE, NOW(), NOW()),
('GENERATING', 2, '생성중', 'AI가 콘텐츠 생성 중', 2, TRUE, NOW(), NOW()),
('GENERATED', 2, '생성완료', 'AI 콘텐츠 생성 완료', 3, TRUE, NOW(), NOW()),
('APPROVED', 2, '승인', '사용자가 콘텐츠 승인', 4, TRUE, NOW(), NOW()),
('REJECTED', 2, '거부', '사용자가 콘텐츠 거부', 5, TRUE, NOW(), NOW()),
('PUBLISHED', 2, '발행완료', '블로그에 발행 완료', 6, TRUE, NOW(), NOW()),
('CONTENT_FAILED', 2, '실패', 'AI 콘텐츠 생성 실패', 7, TRUE, NOW(), NOW()),
-- POST_STATUS
('SCHEDULED', 3, '예약', '발행 예약됨', 1, TRUE, NOW(), NOW()),
('PUBLISHING', 3, '발행중', '블로그에 발행 중', 2, TRUE, NOW(), NOW()),
('POST_PUBLISHED', 3, '발행완료', '블로그에 발행 완료', 3, TRUE, NOW(), NOW()),
('POST_FAILED', 3, '실패', '발행 실패', 4, TRUE, NOW(), NOW()),
-- AUTH_PROVIDER
('LOCAL', 4, '로컬', '이메일/비밀번호 로그인', 1, TRUE, NOW(), NOW()),
('KAKAO', 4, '카카오', '카카오 계정 로그인', 2, TRUE, NOW(), NOW()),
('GOOGLE', 4, '구글', '구글 계정 로그인', 3, TRUE, NOW(), NOW()),
('NAVER', 4, '네이버', '네이버 계정 로그인', 4, TRUE, NOW(), NOW()),
-- USER_ROLE
('ADMIN', 5, '관리자', '시스템 전체 관리 권한', 1, TRUE, NOW(), NOW()),
('USER', 5, '사용자', '일반 사용자 권한', 2, TRUE, NOW(), NOW()),
('GUEST', 5, '게스트', '제한된 권한', 3, TRUE, NOW(), NOW()),
-- USER_STATUS
('ACTIVE', 6, '활성', '정상 활동 중인 사용자', 1, TRUE, NOW(), NOW()),
('INACTIVE', 6, '비활성', '로그인하지 않은 상태', 2, TRUE, NOW(), NOW()),
('SUSPENDED', 6, '정지', '관리자에 의해 정지됨', 3, TRUE, NOW(), NOW()),
('DORMANT', 6, '휴면', '장기간 미접속으로 휴면 전환', 4, TRUE, NOW(), NOW()),
('WITHDRAWN', 6, '탈퇴', '회원 탈퇴', 5, TRUE, NOW(), NOW()),
-- REPEAT_TYPE
('ONCE', 7, '한번만', '1회만 실행', 1, TRUE, NOW(), NOW()),
('DAILY', 7, '매일', '매일 반복 실행', 2, TRUE, NOW(), NOW()),
('WEEKLY', 7, '매주', '매주 반복 실행', 3, TRUE, NOW(), NOW()),
('MONTHLY', 7, '매월', '매월 반복 실행', 4, TRUE, NOW(), NOW()),
('CUSTOM', 7, '사용자정의', '사용자가 정의한 반복 규칙', 5, TRUE, NOW(), NOW()),
-- WORKFLOW_STATUS
('WORKFLOW_PENDING', 8, '대기', '워크플로우 생성 후 첫 실행 대기 중', 1, TRUE, NOW(), NOW()),
('WORKFLOW_ACTIVE', 8, '활성', '워크플로우가 활성화되어 자동 실행 중', 2, TRUE, NOW(), NOW()),
('WORKFLOW_INACTIVE', 8, '비활성', '워크플로우가 비활성화되어 실행 중지', 3, TRUE, NOW(), NOW()),
('WORKFLOW_COMPLETED', 8, '완료', '워크플로우 완전 종료', 4, TRUE, NOW(), NOW()),
-- LOG_LEVEL
('TRACE', 9, '추적', '가장 상세한 추적 정보', 1, TRUE, NOW(), NOW()),
('DEBUG', 9, '디버그', '디버깅용 상세 정보', 2, TRUE, NOW(), NOW()),
('INFO', 9, '정보', '일반 정보성 메시지', 3, TRUE, NOW(), NOW()),
('WARN', 9, '경고', '경고 메시지', 4, TRUE, NOW(), NOW()),
('ERROR', 9, '오류', '오류 메시지', 5, TRUE, NOW(), NOW()),
('FATAL', 9, '치명적', '치명적인 오류', 6, TRUE, NOW(), NOW()),
-- STEP_STATUS
('SUCCESS', 10, '성공', '단계 실행 성공', 1, TRUE, NOW(), NOW()),
('STEP_FAILED', 10, '실패', '단계 실행 실패', 2, TRUE, NOW(), NOW()),
('SKIPPED', 10, '건너뜀', '단계 건너뜀', 3, TRUE, NOW(), NOW()),
('RETRY', 10, '재시도', '재시도 중', 4, TRUE, NOW(), NOW());

-- ============================================
-- 23. 시스템 로그 (system_logs)
-- ============================================
INSERT INTO `system_logs` (`log_id`, `log_level`, `message`, `error_type`, `task_type`, `ip_address`, `stack_trace`,
                           `request_data`, `created_at`, `updated_at`)
VALUES (1, 'INFO', '워크플로우 1 시작', NULL, 'WORKFLOW_START', '127.0.0.1', NULL, '{"workflow_id": 1}', NOW(), NOW()),
       (2, 'ERROR', '크롤링 실패', 'NETWORK_ERROR', 'HTML_CRAWL', '127.0.0.1', 'java.net.ConnectException...',
        '{"url": "https://example.com"}', NOW(), NOW()),
       (3, 'INFO', '워크플로우 2 시작', NULL, 'WORKFLOW_START', '127.0.0.2', NULL, '{"workflow_id": 2}', NOW(), NOW());

-- ============================================
-- 24. 일별 통계 (daily_statistics)
-- ============================================
INSERT INTO `daily_statistics` (`stat_id`, `workflow_id`, `stat_date`, `total_users`, `user_growth_rate`, `total_posts`,
                                `successful_posts`, `post_growth_rate`, `ai_requests`, `ai_cost`, `ai_growth_rate`,
                                `today_value`, `today_growth_rate`, `created_at`, `updated_at`)
VALUES (1, 1, CURDATE(), 1, 0.00, 1, 1, 0.00, 1, 0.01, 0.00, 1, 0.00, NOW(), NOW()),
       (2, 2, CURDATE(), 1, 0.00, 1, 1, 0.00, 1, 0.02, 0.00, 1, 0.00, NOW(), NOW());

-- ============================================
-- 25. 시스템 일별 통계 (system_daily_statistics)
-- ============================================
INSERT INTO `system_daily_statistics` (`stat_id`, `stat_date`, `total_users`, `user_growth_rate`, `total_workflows`,
                                       `workflow_growth_rate`, `post_growth_rate`, `total_ai_requests`, `total_ai_cost`,
                                       `ai_cost_growth_rate`, `active_users_today`, `active_user_growth_rate`,
                                       `created_at`, `updated_at`)
VALUES (1, CURDATE(), 2, 0.00, 2, 0, 0.00, 2, 0.03, 0.00, 2, 0.00, NOW(), NOW());

-- ============================================
-- 26. 포스트 일별 통계 (post_daily_stats)
-- ============================================
INSERT INTO `post_daily_stats` (`post_stat_id`, `blog_post_id`, `user_id`, `stat_date`, `view_count`, `created_at`,
                                `updated_at`)
VALUES (1, 1, 1, CURDATE(), 0, NOW(), NOW()),
       (2, 3, 2, CURDATE(), 0, NOW(), NOW());