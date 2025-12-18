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
       (2, 2, 'admin_blog', 'admin_pw123', 'https://admin.tistory.com', NOW(), NOW()),
       (3, 1, 'user123_fashion', 'password123', 'https://blog.naver.com/user123', NOW(), NOW()),
       (4, 1, 'user123_tech', 'password123', 'https://blog.naver.com/user123', NOW(), NOW()),
       (5, 1, 'user123_galaxy', 'password123', 'https://blog.naver.com/user123', NOW(), NOW());

-- ============================================
-- 5. 트렌드 카테고리 (trend_category)
-- ============================================
# INSERT INTO `trend_category` (`trend_category_id`, `parent_category_id`, `trend_category_name`, `depth`, `created_at`,
#                               `updated_at`)
# VALUES (1, NULL, '패션/뷰티', 1, NOW(), NOW()),
#        (2, NULL, '디지털/가전', 1, NOW(), NOW()),
#        (3, 1, '여성패션', 2, NOW(), NOW()),
#        (4, 2, '스마트폰', 2, NOW(), NOW()),
#        (5, 3, '원피스', 3, NOW(), NOW()),
#        (6, 4, '갤럭시', 3, NOW(), NOW());

INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1, NULL, '패션의류', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (167, 1, '여성의류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (660, 167, '코디세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (683, 167, '티셔츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (684, 167, '블라우스/셔츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (685, 167, '니트/스웨터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (686, 167, '카디건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (687, 167, '원피스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (688, 167, '스커트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (689, 167, '청바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (690, 167, '바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (691, 167, '점프슈트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (692, 167, '레깅스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (693, 167, '코트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (694, 167, '점퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (695, 167, '재킷', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (696, 167, '정장세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (697, 167, '조끼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (698, 167, '트레이닝복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (699, 167, '한복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (700, 167, '파티복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (701, 167, '유니폼/단체복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (702, 167, '레인코트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (168, 1, '여성언더웨어/잠옷', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (703, 168, '브라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (704, 168, '팬티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (705, 168, '브라팬티세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (706, 168, '잠옷/홈웨어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (707, 168, '슬립', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (708, 168, '러닝/캐미솔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (709, 168, '속치마/속바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1297, 168, '보정속옷', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1298, 168, '시즌성내의', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1299, 168, '언더웨어소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (169, 1, '남성의류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (710, 169, '티셔츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (711, 169, '니트/스웨터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (712, 169, '카디건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (713, 169, '셔츠/남방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (714, 169, '조끼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (715, 169, '청바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (716, 169, '바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (717, 169, '점퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (718, 169, '재킷', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (719, 169, '코트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (720, 169, '정장세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (721, 169, '트레이닝복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (722, 169, '한복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (723, 169, '유니폼/단체복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (724, 169, '레인코트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1948, 169, '코디세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45823, 169, '점프슈트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (170, 1, '남성언더웨어/잠옷', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (725, 170, '팬티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (726, 170, '러닝', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (727, 170, '러닝팬티세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (728, 170, '잠옷/홈웨어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1300, 170, '보정속옷', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1301, 170, '시즌성내의', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2, NULL, '패션잡화', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (166, 2, '양말', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1319, 166, '여성양말', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1320, 166, '남성양말', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (171, 2, '여성신발', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (661, 171, '부티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (662, 171, '슬리퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (663, 171, '실내화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1302, 171, '단화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1303, 171, '힐/펌프스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1304, 171, '워커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1305, 171, '부츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1306, 171, '운동화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1307, 171, '샌들', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1308, 171, '기능화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (172, 2, '남성신발', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (597, 172, '웰트화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (598, 172, '실내화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (664, 172, '슬립온', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (665, 172, '모카신/털신', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (666, 172, '보트슈즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (667, 172, '구두', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (668, 172, '스니커즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (669, 172, '샌들', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (670, 172, '슬리퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (671, 172, '워커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (672, 172, '부츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1309, 172, '운동화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1310, 172, '기능화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (173, 2, '신발용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (599, 173, '신발깔창', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (600, 173, '신발끈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (601, 173, '보호쿠션/패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (602, 173, '부츠키퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (603, 173, '구둣주걱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (604, 173, '기타신발용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2004, 173, '슈즈커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (174, 2, '여성가방', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (571, 174, '숄더백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (572, 174, '토트백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (573, 174, '크로스백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (574, 174, '클러치백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (575, 174, '파우치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (576, 174, '백팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (577, 174, '힙색/슬링백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1311, 174, '가방소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46755, 174, '에코백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46981, 174, '메신저백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (175, 2, '남성가방', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (578, 175, '숄더백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (579, 175, '토트백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (580, 175, '크로스백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (581, 175, '클러치백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (582, 175, '브리프케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (583, 175, '백팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (584, 175, '힙색/슬링백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46754, 175, '에코백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46979, 175, '메신저백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (176, 2, '여행용가방/소품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (585, 176, '보스턴가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (586, 176, '복대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (587, 176, '이민/유학용 가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (588, 176, '슈트케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (589, 176, '여권지갑/케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (590, 176, '여행소품케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (591, 176, '네임태그', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (592, 176, '잠금벨트/자물쇠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1935, 176, '캐리어소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2003, 176, '캐리어커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42805, 176, '기내용 캐리어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42806, 176, '중대형 캐리어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (177, 2, '지갑', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (480, 177, '통장지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (481, 177, '지갑기타세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (593, 177, '머니클립', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (594, 177, '카드/명함지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (595, 177, '열쇠지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (596, 177, '동전지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1314, 177, '여성지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1315, 177, '남성지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (178, 2, '벨트', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (482, 178, '여성벨트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (483, 178, '멜빵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1316, 178, '남성벨트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (179, 2, '모자', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (484, 179, '군모', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (485, 179, '선캡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (486, 179, '비니', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (487, 179, '페도라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (488, 179, '두건/반다나', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (489, 179, '사파리모자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (490, 179, '헌팅캡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (491, 179, '귀달이모자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (492, 179, '방울털모자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (493, 179, '귀마개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1317, 179, '야구모자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1318, 179, '스냅백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1997, 179, '베레모', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (180, 2, '장갑', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (494, 180, '여성장갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (495, 180, '남성장갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (496, 180, '암워머/토시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (181, 2, '선글라스/안경테', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (497, 181, '선글라스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (498, 181, '선글라스 케이스/소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (499, 181, '안경테', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (500, 181, '안경케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (501, 181, '안경소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (502, 181, '안경줄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (182, 2, '헤어액세서리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (503, 182, '헤어밴드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (504, 182, '헤어핀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (505, 182, '헤어끈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (506, 182, '헤어액세서리소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1321, 182, '가발', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (183, 2, '패션소품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (398, 183, '기타패션소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (507, 183, '커프스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (508, 183, '머플러', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (509, 183, '넥워머', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (510, 183, '숄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (511, 183, '넥케이프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (512, 183, '행커치프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (513, 183, '키홀더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (514, 183, '부채', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (515, 183, '와펜', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (516, 183, '코르사주', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (517, 183, '한복소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1322, 183, '스카프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1323, 183, '손수건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1324, 183, '넥타이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1325, 183, '우산', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1326, 183, '양산', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1327, 183, '스타킹', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1328, 183, '브로치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1329, 183, '라이터/담배용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (184, 2, '시계', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (394, 184, '커플시계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (395, 184, '아동시계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (399, 184, '시계수리용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1330, 184, '패션시계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1331, 184, '시계소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (185, 2, '순금', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (396, 185, '골드바', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (397, 185, '순금기념품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2005, 185, '실버바', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (186, 2, '주얼리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1332, 186, '반지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1333, 186, '귀걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1334, 186, '목걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1335, 186, '펜던트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1336, 186, '주얼리세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1337, 186, '주얼리소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1338, 186, '팔찌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1941, 186, '발찌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46992, 186, '피어싱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (3, NULL, '화장품/미용', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (187, 3, '스킨케어', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (323, 187, '넥케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (400, 187, '스킨/토너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (401, 187, '로션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (402, 187, '에센스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (403, 187, '크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (404, 187, '아이케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (405, 187, '미스트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (406, 187, '페이스오일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (407, 187, '화장품세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46419, 187, '톤업크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47004, 187, '토너패드/앰플패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (188, 3, '선케어', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (408, 188, '선크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (409, 188, '선스프레이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (410, 188, '선스틱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (411, 188, '선파우더/쿠션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (412, 188, '애프터선', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (413, 188, '선케어세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1339, 188, '태닝', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (189, 3, '클렌징', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (414, 189, '클렌징폼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (415, 189, '클렌징오일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (416, 189, '클렌징크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (417, 189, '클렌징로션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (418, 189, '클렌징젤', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (419, 189, '클렌징워터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (420, 189, '클렌징티슈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (421, 189, '클렌징비누', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (422, 189, '클렌징파우더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (423, 189, '립앤아이리무버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (424, 189, '스크럽/필링', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (425, 189, '클렌징세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (190, 3, '마스크/팩', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (426, 190, '마스크시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (427, 190, '필오프팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (428, 190, '워시오프팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (429, 190, '코팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (430, 190, '수면팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (431, 190, '마사지크림/젤', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (432, 190, '마스크/팩세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47003, 190, '모델링팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (191, 3, '베이스메이크업', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (326, 191, '메이크업베이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (328, 191, '컨실러', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (362, 191, '베이스메이크업세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (433, 191, 'BB/CC크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (435, 191, '프라이머', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1215, 191, '파우더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1216, 191, '파운데이션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (192, 3, '색조메이크업', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (363, 192, '립스틱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (364, 192, '립케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (365, 192, '립글로스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (366, 192, '립틴트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (367, 192, '립라이너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (368, 192, '아이섀도', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (369, 192, '마스카라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (370, 192, '아이브로', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (371, 192, '블러셔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (372, 192, '하이라이터/쉐이딩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (373, 192, '색조메이크업세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1217, 192, '아이라이너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45821, 192, '속눈썹영양제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (193, 3, '네일케어', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (374, 193, '매니큐어/젤네일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (375, 193, '네일아트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (376, 193, '네일영양제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (377, 193, '네일리무버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (378, 193, '네일케어도구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (379, 193, '네일케어세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47002, 193, '네일팁/페디팁', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (194, 3, '바디케어', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (271, 194, '바디크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (272, 194, '바디오일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (273, 194, '바디미스트/샤워코롱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (274, 194, '바디파우더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (275, 194, '바디클렌저', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (276, 194, '바디스크럽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (277, 194, '여성청결제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (278, 194, '목욕비누', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (279, 194, '핸드케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (280, 194, '풋케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (281, 194, '입욕제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (282, 194, '아로마테라피', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (283, 194, '데오드란트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (284, 194, '제모제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (285, 194, '바디슬리밍', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (286, 194, '바디케어세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (380, 194, '바디로션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (195, 3, '헤어케어', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (287, 195, '샴푸', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (288, 195, '린스/컨디셔너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (289, 195, '트리트먼트/헤어팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (290, 195, '헤어에센스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (292, 195, '헤어미스트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (293, 195, '두피케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (294, 195, '탈모케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (295, 195, '헤어케어세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (196, 3, '헤어스타일링', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (296, 196, '헤어왁스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (297, 196, '헤어스프레이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (298, 196, '헤어무스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (299, 196, '헤어젤', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (301, 196, '염색약', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1218, 196, '파마약', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (197, 3, '향수', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (302, 197, '여성향수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (303, 197, '남성향수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (304, 197, '남녀공용향수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (305, 197, '향수세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47005, 197, '고체향수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (198, 3, '뷰티소품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (306, 198, '바디소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (307, 198, '타투', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (308, 198, '화장품케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1219, 198, '아이소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1220, 198, '페이스소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1221, 198, '헤어소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1222, 198, '메이크업브러시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1910, 198, 'DIY화장품재료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (199, 3, '남성화장품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (309, 199, '스킨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (310, 199, '로션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (311, 199, '에센스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (312, 199, '크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (313, 199, '아이케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (314, 199, '올인원', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (315, 199, '선케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (316, 199, '클렌징', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (317, 199, '스크럽/필링', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (318, 199, '마스크/팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (319, 199, '메이크업', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (320, 199, '쉐이빙케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (321, 199, '남성청결제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (322, 199, '남성화장품세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (4, NULL, '디지털/가전', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (87, 4, '학습기기', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1059, 87, '학습기기액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1560, 87, '전자사전', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1561, 87, '전자책', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1562, 87, '어학학습기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1563, 87, '학습보조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1564, 87, '보이스레코더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (88, 4, '게임기/타이틀', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1060, 88, '게임기주변기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1565, 88, '가정용게임기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1566, 88, '휴대용게임기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1567, 88, 'PC게임', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1568, 88, '게임타이틀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (89, 4, 'PC', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1569, 89, '브랜드PC', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1570, 89, '조립/베어본PC', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1571, 89, '서버/워크스테이션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (90, 4, 'PC액세서리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1061, 90, 'USB액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1406, 90, '마우스패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1407, 90, '손목받침대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1409, 90, 'PC받침대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1410, 90, 'PC홀더/브라켓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1411, 90, '키보드키스킨/스티커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1412, 90, '클리너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1413, 90, '케이블타이/정리함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1414, 90, '기타PC액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (91, 4, '노트북액세서리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1062, 91, '노트북보호필름', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1415, 91, '노트북가방/케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1416, 91, '노트북받침대/쿨러', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1417, 91, '노트북보안기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1418, 91, '노트북어댑터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1419, 91, '노트북용배터리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1420, 91, '노트북키스킨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1421, 91, '노트북도난방지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1422, 91, '기타노트북액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (92, 4, '태블릿PC액세서리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1063, 92, '태블릿PC보호필름', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1423, 92, '케이스/파우치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1424, 92, '스탠드/Dock', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7053, 92, '터치펜/기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (93, 4, '모니터주변기기', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1425, 93, '모니터받침대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1426, 93, '모니터어댑터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1427, 93, '모니터브라켓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1428, 93, '기타모니터주변기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1945, 93, '모니터암', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46770, 93, '모니터 액정필름/커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (94, 4, '주변기기', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1064, 94, '마우스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1065, 94, '키보드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1066, 94, '타블렛/액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1067, 94, '복합기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1068, 94, '프린터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1069, 94, '복합기/프린터소모품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1070, 94, '스캐너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1429, 94, '키보드/마우스세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (95, 4, '멀티미디어장비', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1071, 95, 'DVR', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1072, 95, 'PC스피커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1073, 95, '영상수신장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1074, 95, '사운드카드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1075, 95, '영상편집카드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1430, 95, 'Divx플레이어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1431, 95, 'PC마이크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1432, 95, '휴대용스피커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1433, 95, '웹캠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1434, 95, 'PC헤드셋', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (96, 4, '저장장치', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1076, 96, 'ODD', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1077, 96, '공미디어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1435, 96, '외장HDD', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1436, 96, '외장SSD', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1437, 96, 'NAS', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1450, 96, 'USB메모리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1451, 96, 'HDD', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1452, 96, 'SSD', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1453, 96, '기타저장장치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1454, 96, '저장장치액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46786, 96, '도킹스테이션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46787, 96, '외장스토리지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (97, 4, 'PC부품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1078, 97, 'RAM', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1079, 97, '그래픽카드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1080, 97, '메인보드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1081, 97, '파워서플라이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1082, 97, 'PC케이블', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1083, 97, '인터페이스카드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1084, 97, '쿨러', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1085, 97, '튜닝용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1455, 97, 'CPU', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1456, 97, 'PC케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (98, 4, '네트워크장비', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1086, 98, '공유기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1087, 98, '랜카드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1340, 98, 'KVM케이블', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1341, 98, '네트워크모듈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1342, 98, '네트워크테스트기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1343, 98, '리피터장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1345, 98, '무선모뎀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1346, 98, '모뎀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1347, 98, '블루투스동글', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1348, 98, '선택기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1349, 98, '스위칭허브', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1350, 98, '시리얼장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1351, 98, '안테나', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1352, 98, '컨버터장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1353, 98, '프린터공유기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1354, 98, '기타네트워크장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1457, 98, '라우터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1458, 98, 'AP', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1459, 98, 'KVM스위치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (99, 4, '소프트웨어', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1355, 99, '운영체제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1356, 99, '보안/백신', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1357, 99, '사무/회계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1358, 99, '개발툴', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1359, 99, '그래픽/멀티미디어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1360, 99, '번역', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1361, 99, '유틸리티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (151, 4, '노트북', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (152, 4, '태블릿PC', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (153, 4, '모니터', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (200, 4, '휴대폰', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (245, 200, '공기계/중고폰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (246, 200, '해외출시폰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1362, 200, '자급제폰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (201, 4, '휴대폰액세서리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (248, 201, '휴대폰케이블', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (250, 201, '휴대폰렌즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (251, 201, '휴대폰거치대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (252, 201, '휴대폰줄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (253, 201, '휴대폰이어캡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (254, 201, '핸드셋', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (256, 201, '휴대폰DMB수신기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (257, 201, '웨어러블 디바이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (258, 201, '휴대폰쿨링패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (259, 201, '기타휴대폰액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1223, 201, '휴대폰케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1224, 201, '휴대폰보호필름', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1225, 201, '휴대폰충전기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1226, 201, '휴대폰배터리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1955, 201, '짐벌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1956, 201, '셀카봉', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1957, 201, '웨어러블 디바이스 액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (202, 4, '카메라/캠코더용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (260, 202, 'DSLR카메라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (261, 202, '미러리스디카', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (262, 202, '일반디카', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (263, 202, '캠코더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1227, 202, '카메라렌즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1228, 202, '렌즈용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1229, 202, '즉석카메라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1230, 202, '필름카메라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1231, 202, '메모리카드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1232, 202, '카드리더기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1233, 202, '카메라가방/케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1234, 202, '카메라스트랩/그립', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1235, 202, '삼각대/헤드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1236, 202, '플래시/조명용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1237, 202, '충전기/배터리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1238, 202, 'LCD용품/보호필름', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1239, 202, '필름/관련용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1240, 202, '카메라/캠코더 관련용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2038, 202, '액션캠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (203, 4, '광학기기/용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1825, 203, '망원경', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1826, 203, '쌍안경', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1827, 203, '천체망원경', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1828, 203, '현미경', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1829, 203, '광학용품액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (204, 4, '영상가전', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1241, 204, 'TV', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1242, 204, '영상가전액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1243, 204, '프로젝터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1244, 204, '프로젝터주변기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1245, 204, '영상플레이어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1830, 204, '디지털액자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2036, 204, '사이니지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (205, 4, '음향가전', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1246, 205, '홈시어터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1247, 205, '오디오', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1248, 205, '스피커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1249, 205, '카세트플레이어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1250, 205, '마이크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1251, 205, 'MP3/PMP액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1252, 205, '블루투스셋', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1253, 205, '이어폰/헤드폰액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1779, 205, '데크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1780, 205, '리시버/앰프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1781, 205, '튜너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1782, 205, '오디오믹서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1783, 205, '턴테이블', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1784, 205, '방송음향기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1785, 205, 'DAC', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1786, 205, '라디오', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1787, 205, 'CD플레이어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1788, 205, 'MD플레이어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1789, 205, '노래반주기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1790, 205, 'MP3', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1791, 205, 'PMP', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1792, 205, '이어폰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1793, 205, '헤드폰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (206, 4, '생활가전', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1254, 206, '세탁/건조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1257, 206, '다리미', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1258, 206, '디지털도어록', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1259, 206, '무전기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1260, 206, '스탠드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1261, 206, '전화기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1262, 206, '구강청정기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1794, 206, '재봉틀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1795, 206, '보풀제거기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1796, 206, '손소독기/손세정기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1797, 206, '자외선소독기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1798, 206, '핸드드라이어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1799, 206, '연수기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1800, 206, '이온수기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1801, 206, '해충퇴치기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2013, 206, '업소용자외선소독기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2035, 206, '전신건조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (207, 4, '이미용가전', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1264, 207, '면도기소모품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1676, 207, '이미용가전액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1690, 207, '기타이미용가전', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1807, 207, '코털제거기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1808, 207, '눈썹정리기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1809, 207, '손발톱정리기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1810, 207, '두피케어기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1811, 207, '피부케어기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1812, 207, '제모기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1813, 207, '이발기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46779, 207, '속눈썹고데기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46780, 207, '전기면도기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46781, 207, '헤어기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (208, 4, '계절가전', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1265, 208, '냉풍기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1266, 208, '선풍기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1267, 208, '에어컨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1268, 208, '온풍기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1269, 208, '온수기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1270, 208, '보일러', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1271, 208, '가습기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1272, 208, '공기정화기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1273, 208, '제습기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1274, 208, '전기매트/장판', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1275, 208, '전기요/담요/방석', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1364, 208, '에어커튼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1677, 208, '냉온풍기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1679, 208, '라디에이터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1993, 208, '에어컨주변기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1994, 208, '컨벡터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2019, 208, '업소용냉온풍기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45791, 208, '냉/온수매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45792, 208, '히터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (209, 4, '주방가전', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1042, 209, '오븐', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1043, 209, '식기세척/건조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1044, 209, '전기포트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1045, 209, '정수기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1046, 209, '커피머신/메이커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1047, 209, '토스터기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1048, 209, '전기쿠커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1155, 209, '가스레인지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1156, 209, '전기밥솥', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1276, 209, '냉장고', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1277, 209, '김치냉장고', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1278, 209, '전용냉장고', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1538, 209, '진공포장기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1539, 209, '음식물처리기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1542, 209, '제빵기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1543, 209, '거품/반죽기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1544, 209, '전기그릴', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1545, 209, '생선그릴', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1546, 209, '전기팬', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1547, 209, '튀김기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1548, 209, '핸드블렌더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1549, 209, '홍삼제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1550, 209, '식품건조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1551, 209, '두부두유제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1552, 209, '요구르트제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1553, 209, '아이스크림제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1554, 209, '죽제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1555, 209, '샌드위치제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1556, 209, '와플제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1557, 209, '탄산수제조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1558, 209, '기타주방가전', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1680, 209, '냉동고', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1681, 209, '가스레인지후드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1682, 209, '전자레인지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1683, 209, '인덕션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1684, 209, '하이라이트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1685, 209, '핫플레이트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1686, 209, '쥬서기/녹즙기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1687, 209, '믹서기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1688, 209, '빙수기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1689, 209, '분쇄기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2012, 209, '업소용튀김기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2014, 209, '업소용음식물처리기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2015, 209, '업소용믹서기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2016, 209, '업소용빙수기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2017, 209, '업소용진공포장기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2018, 209, '업소용거품/반죽기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2037, 209, '에어프라이어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2044, 209, '하이브리드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7052, 209, '기타주방가전부속품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46788, 209, '냉장고세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46789, 209, '식물재배기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46790, 209, '식물재배기액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (210, 4, '자동차기기', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1049, 210, '블랙박스/액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1050, 210, '내비게이션/액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1051, 210, '하이패스/GPS', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1052, 210, '전방/후방카메라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1053, 210, '자동차TV/모니터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1054, 210, '카오디오음향기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1055, 210, '카팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1056, 210, '헤드유닛', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1058, 210, '자동차AV용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1559, 210, '핸즈프리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46796, 4, '청소기', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46797, 46796, '고압세척기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46798, 46796, '로봇청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46799, 46796, '무선청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46803, 46796, '물걸레청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46804, 46796, '스팀청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46805, 46796, '업소용청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46806, 46796, '유선청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46809, 46796, '창문청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46810, 46796, '청소기액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46811, 46796, '침구청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (5, NULL, '가구/인테리어', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (100, 5, '침실가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1088, 100, '침대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1090, 100, '장롱/붙박이장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1091, 100, '화장대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1092, 100, '거울', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1157, 100, '협탁', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1158, 100, '부부테이블', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1159, 100, '침실세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7040, 100, '서랍장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47009, 100, '매트리스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (101, 5, '거실가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1094, 101, '소파', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1095, 101, '테이블', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1160, 101, 'TV거실장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1161, 101, '장식장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (102, 5, '주방가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1096, 102, '식탁/의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1162, 102, '레인지대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1164, 102, '왜건/카트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1165, 102, '주방수납장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1166, 102, '그릇장/컵보드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1167, 102, '기타주방가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (103, 5, '수납가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1168, 103, '행거', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1169, 103, '수납장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1170, 103, '선반', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1171, 103, '공간박스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1172, 103, '고가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1173, 103, '나비장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1174, 103, 'CD/DVD장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1175, 103, '신발장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1176, 103, '우산꽂이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1177, 103, '잡지꽂이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1178, 103, '코너장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1179, 103, '소품수납함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (104, 5, '아동/주니어가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1097, 104, '침대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1180, 104, '책상', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1181, 104, '책상의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1182, 104, '책상의자세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1183, 104, '책장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1184, 104, '책꽂이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1185, 104, '옷장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1186, 104, '행거', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1187, 104, '서랍장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1188, 104, '수납장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1189, 104, '의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1190, 104, '소파', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1191, 104, '소품가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1192, 104, '아동침실세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (105, 5, '서재/사무용가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1098, 105, '책상', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1099, 105, '의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1100, 105, '사무/교구용가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1193, 105, '책장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1194, 105, '책꽂이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (106, 5, '아웃도어가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (922, 106, '야외테이블', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (923, 106, '야외의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (924, 106, '정원그네', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (925, 106, '정자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (926, 106, '야외벤치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (927, 106, '기타아웃도어가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (107, 5, 'DIY자재/용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (928, 107, '목재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (929, 107, '반제품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (930, 107, '손잡이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (931, 107, '파벽돌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (932, 107, '패널', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (933, 107, '데코스티커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (934, 107, '접착제/보수용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (978, 107, '가구부속품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (979, 107, '바닥재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (980, 107, '타일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (981, 107, '벽지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42810, 107, '리모델링', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45782, 107, '시트지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45783, 107, '몰딩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (108, 5, '인테리어소품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (836, 108, '워터볼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (837, 108, '우체통', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (838, 108, '도어벨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (839, 108, '디자인문패', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (840, 108, '냉장고자석', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (841, 108, '앤틱소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (842, 108, '전통공예소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (843, 108, '기타장식용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (935, 108, '장식인형', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (936, 108, '장식미니어처', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (937, 108, '화병', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (938, 108, '인테리어파티션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (939, 108, '인테리어창문', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (940, 108, '인터폰박스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (941, 108, '인테리어분수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (942, 108, '오르골', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (982, 108, '스탠드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (983, 108, '조명', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (984, 108, '시계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (985, 108, '액자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (986, 108, '아로마/캔들용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1947, 108, '미술작품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46764, 108, '패브릭포스터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (109, 5, '침구단품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (844, 109, '스프레드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (845, 109, '차렵이불', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (846, 109, '홑이불', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (847, 109, '이불커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (848, 109, '담요', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (849, 109, '무릎담요', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (850, 109, '전기매트커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (851, 109, '기타침구단품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (987, 109, '매트/침대커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (989, 109, '패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (990, 109, '요', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2033, 109, '토퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2034, 109, '토퍼커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (110, 5, '침구세트', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (852, 110, '한실예단세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (991, 110, '침대커버세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (992, 110, '매트커버세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (993, 110, '이불베개세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (994, 110, '이불패드세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (995, 110, '요이불세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (111, 5, '솜류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (853, 111, '쿠션솜', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (854, 111, '방석솜', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (996, 111, '베개솜/속통', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (997, 111, '요솜/매트솜', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (998, 111, '이불솜', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (112, 5, '카페트/러그', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (732, 112, '쿨매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (855, 112, '러그', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (856, 112, '발매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (857, 112, '대자리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (858, 112, '왕골자리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (999, 112, '카페트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (113, 5, '커튼/블라인드', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (737, 113, '로만셰이드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (739, 113, '블라인드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (740, 113, '버티컬', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (741, 113, '롤스크린', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (742, 113, '바란스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (743, 113, '캐노피', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (746, 113, '자바라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (747, 113, '기타액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1000, 113, '커튼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1940, 113, '콤비블라인드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (114, 5, '수예', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (729, 114, '원단', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (730, 114, '수예용품/부자재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (731, 114, '기타수예', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1004, 114, '뜨개질', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1005, 114, '자수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1006, 114, '퀼트/펠트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1999, 114, '보석십자수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (154, 5, '홈데코', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1001, 154, '커버류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1002, 154, '주방데코', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1003, 154, '쿠션/방석', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46758, 5, '베개', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46759, 46758, '계절베개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46760, 46758, '라텍스베개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46761, 46758, '메모리폼베개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46762, 46758, '베개커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46763, 46758, '베개커버세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (6, NULL, '출산/육아', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (115, 6, '분유', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (734, 115, '국내분유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (735, 115, '수입분유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (736, 115, '특수분유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (116, 6, '기저귀', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46944, 116, '기저귀커버/기저귀밴드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46945, 116, '수영장기저귀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46946, 116, '일회용기저귀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46950, 116, '천기저귀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (117, 6, '물티슈', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1921, 117, '캡형', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1922, 117, '리필형', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1923, 117, '휴대용', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1924, 117, '혼합세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46416, 117, '기능성물티슈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46417, 117, '코인티슈/업소용', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46418, 117, '물티슈워머/물티슈캡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (118, 6, '이유식', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45815, 118, '가공이유식', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45816, 118, '수제이유식', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45817, 118, '이유식재료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (119, 6, '아기간식', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (654, 119, '유아두유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (655, 119, '유아과자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1936, 119, '유아유제품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1937, 119, '유아음료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (120, 6, '수유용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (605, 120, '유축기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (606, 120, '분유케이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (607, 120, '보틀워머', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (608, 120, '모유보관비닐팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (609, 120, '수유쿠션/시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (610, 120, '수유가리개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (611, 120, '수유패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (612, 120, '유두케어/젖몸살용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (613, 120, '기타수유용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (657, 120, '젖병', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (658, 120, '젖꼭지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (659, 120, '노리개젖꼭지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (121, 6, '유모차', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (614, 121, '초경량/휴대용', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (615, 121, '절충형/디럭스형', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1009, 121, '유모차용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1925, 121, '쌍둥이용', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1926, 121, '유모차/카시트 세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (122, 6, '카시트', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1010, 122, '카시트용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1927, 122, '신생아카시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1928, 122, '영유아카시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1929, 122, '주니어카시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46978, 122, '부스터카시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (123, 6, '외출용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (616, 123, '아기띠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (617, 123, '아기띠쿨러/패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (618, 123, '아기띠침받이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (619, 123, '기저귀가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (620, 123, '힙시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (621, 123, '포대기/처네', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (623, 123, '슬링', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (624, 123, '망토/워머', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (625, 123, '미아방지용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (626, 123, '기타외출용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (124, 6, '목욕용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (627, 124, '유아욕조', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (628, 124, '유아목욕의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (629, 124, '유아목욕가운', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (630, 124, '유아목욕타월', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (631, 124, '유아샴푸캡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (632, 124, '유아목욕장갑/스펀지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (633, 124, '유아세면대/수도꼭지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (634, 124, '유아욕탕온도계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (635, 124, '유아목욕장난감', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (636, 124, '욕실정리망/정리함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (637, 124, '기타목욕용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (125, 6, '스킨/바디용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (638, 125, '기저귀크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (639, 125, '유아크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (640, 125, '유아로션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (641, 125, '유아오일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (643, 125, '유아파우더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (644, 125, '유아립케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (645, 125, '유아비누', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (646, 125, '유아바스/샴푸', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (647, 125, '유아입욕제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (648, 125, '기타스킨/바디용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1930, 125, '혼합세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2043, 125, '어린이네일케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46694, 125, '색조화장품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46958, 125, '유아선케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (126, 6, '위생/건강용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (536, 126, '유아변기/커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (537, 126, '유아면봉', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (538, 126, '유아손톱가위/손톱깎이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (540, 126, '유아손세정제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (543, 126, '기저귀휴지통', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (544, 126, '분통/파우더통', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (545, 126, '유아이발용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (546, 126, '제균스프레이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (547, 126, '콧물흡입기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (548, 126, '키재기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (549, 126, '투약기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (550, 126, '해열시트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (557, 126, '유아항균팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46972, 126, '유아마스크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (127, 6, '구강청결용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (552, 127, '유아칫솔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (553, 127, '유아치약', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (554, 127, '유아구강세정제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (555, 127, '유아구강청결티슈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (556, 127, '손가락빨기방지용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (558, 127, '기타구강청결용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (128, 6, '유아세제', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (559, 128, '유아세탁세제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (560, 128, '유아유연제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (561, 128, '유아세탁비누', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1931, 128, '유아표백제/얼룩제거제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1932, 128, '혼합세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (129, 6, '소독/살균용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (562, 129, '젖병소독기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (563, 129, '젖병세정제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (564, 129, '젖병솔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (565, 129, '젖병집게', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (566, 129, '젖병건조대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (567, 129, '장난감소독기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46957, 129, '젖병소독기용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (130, 6, '매트/안전용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (518, 130, '안전문', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (519, 130, '모서리보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (520, 130, '머리보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (521, 130, '무릎보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (522, 130, '문닫힘방지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (524, 130, '디딤대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (525, 130, '모기밴드/퇴치용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (526, 130, '안전잠금장치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (527, 130, '콘센트안전커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46951, 130, '놀이방매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (131, 6, '유아가구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (436, 131, '기저귀정리함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (437, 131, '기타유아가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (528, 131, '유아침대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (529, 131, '유아책상', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (530, 131, '유아공부상', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (531, 131, '유아의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (532, 131, '유아소파', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (533, 131, '유아이유식의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (534, 131, '유아옷걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (535, 131, '장난감정리함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (132, 6, '이유식용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (438, 132, '유아컵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (439, 132, '유아식기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (440, 132, '유아스푼/포크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (441, 132, '연습용젓가락', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (442, 132, '턱받이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (443, 132, '조리기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (444, 132, '과즙망', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (445, 132, '기타이유식용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (133, 6, '임부복', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (446, 133, '수유복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (447, 133, '원피스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (448, 133, '바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (449, 133, '청바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (450, 133, '트레이닝복/요가복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (451, 133, '스커트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (452, 133, '스타킹', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (453, 133, '레깅스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (454, 133, '임부용수영복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1011, 133, '임부속옷', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (134, 6, '임산부용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (267, 134, '임산부바디필로우', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (268, 134, '기타임산부용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (455, 134, '산모방석', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (456, 134, '전자파차단앞치마', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (457, 134, '임산부화장품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (458, 134, '임산부보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1012, 134, '태교용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1995, 134, '모유수유차', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (135, 6, '유아침구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (459, 135, '속싸개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (460, 135, '겉싸개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (461, 135, '아기이불/요/패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (462, 135, '보낭/슬리핑백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (463, 135, '방수요', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (464, 135, 'DIY 아기용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (465, 135, '기타유아침구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1912, 135, '유아베개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1913, 135, '낮잠이불', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (136, 6, '출산/돌기념품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (466, 136, '기저귀케이크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (467, 136, '탯줄보관함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (468, 136, '손발도장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (469, 136, '탯줄도장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (470, 136, '성장앨범/액자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (471, 136, '기타출산/돌기념품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2020, 136, '유치보관함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2021, 136, '성장카드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2022, 136, '셀프촬영', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2023, 136, '돌잔치용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (137, 6, '신생아의류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (472, 137, '레그/스패츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (473, 137, '바디슈트/롬퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (474, 137, '배냇저고리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (475, 137, '손/발싸개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (476, 137, '신생아모자/보닛', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (477, 137, '우주복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1914, 137, '가제손수건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1915, 137, '세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (138, 6, '유아동의류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (265, 138, '조끼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (266, 138, '상하세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (381, 138, '니트/스웨터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (382, 138, '카디건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (383, 138, '바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (384, 138, '스커트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (385, 138, '드레스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (386, 138, '원피스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (387, 138, '정장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (388, 138, '트레이닝복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (389, 138, '재킷', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (390, 138, '점퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (391, 138, '코트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (478, 138, '티셔츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (479, 138, '블라우스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2046, 138, '셔츠/남방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2047, 138, '청바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2048, 138, '레깅스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2049, 138, '점프슈트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2050, 138, '교복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2051, 138, '한복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2052, 138, '스키복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2053, 138, '댄스복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2054, 138, '코스튬의상', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2055, 138, '공주드레스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2056, 138, '패밀리룩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2057, 138, '레인코트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46975, 138, '발레복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (139, 6, '유아동잡화', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (222, 139, '양말', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (223, 139, '우산', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (224, 139, '벨트/멜빵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (264, 139, '기타유아동잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (329, 139, '지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (330, 139, '모자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (331, 139, '장갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (332, 139, '귀마개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (333, 139, '목도리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (334, 139, '스카프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (335, 139, '앞치마/토시/두건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (336, 139, '넥타이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (337, 139, '선글라스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1013, 139, '신발', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1014, 139, '가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2045, 139, '헤어액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2058, 139, '타이즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46977, 139, '한복소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (140, 6, '수영복/용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (338, 140, '남아수영복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (339, 140, '여아수영복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (340, 140, '수경/수모/귀마개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (341, 140, '수영가방/비치백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (141, 6, '유아발육용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (342, 141, '바운서/흔들침대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (343, 141, '보행기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (344, 141, '쏘서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (345, 141, '점퍼루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (142, 6, '완구/인형', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (324, 142, '캐릭터카드/딱지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1015, 142, '작동완구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1016, 142, '감각발달완구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1017, 142, '공간놀이기구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1018, 142, '물놀이용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1019, 142, '미술놀이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1020, 142, '블록', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1021, 142, '스포츠완구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1022, 142, '승용완구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1023, 142, '유아/어린이자전거', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1024, 142, '신생아/영유아완구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1025, 142, '언어/학습완구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1026, 142, '역할놀이/소꿉놀이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1027, 142, '원목교구/가베', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1028, 142, '자연/과학완구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1029, 142, '유아동퍼즐', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1030, 142, '음악/악기놀이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46962, 142, '인형', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (144, 6, '교구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (220, 144, '학습보드게임', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (221, 144, '비디오/DVD', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1963, 144, '학습교구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (214, 6, '유아동 주얼리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2059, 214, '목걸이/펜던트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2060, 214, '귀걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2061, 214, '팔찌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2063, 214, '순금돌반지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2064, 214, '순금주얼리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2065, 214, '주얼리세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (215, 6, '유아동언더웨어/잠옷', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2066, 215, '잠옷/홈웨어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2067, 215, '수면조끼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2068, 215, '내의/내복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2069, 215, '러닝', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2070, 215, '팬티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2071, 215, '브라', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2072, 215, '러닝팬티세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2073, 215, '브라팬티세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2074, 215, '속치마/속바지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2075, 215, '배변훈련팬티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7, NULL, '식품', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (24, 7, '건강식품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (956, 24, '비타민제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (957, 24, '한방재료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (958, 24, '영양제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1721, 24, '건강환/정', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1724, 24, '인삼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1725, 24, '꿀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2024, 24, '건강즙/과일즙', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46510, 24, '홍삼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46516, 24, '환자식/영양보충식', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46867, 24, '로얄제리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46868, 24, '숙취해소제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46874, 24, '효모', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46875, 24, '효소', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47078, 24, '건강분말', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (25, 7, '다이어트식품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1595, 25, '기타다이어트식품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1726, 25, '다이어트차', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1727, 25, '식이섬유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1729, 25, '가르시니아', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1730, 25, 'CLA', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2026, 25, '콜라겐', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2027, 25, '와일드망고', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2028, 25, '잔티젠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2029, 25, '카테킨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2030, 25, '히알루론산', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7049, 25, '레몬밤', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46545, 25, '단백질보충제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46552, 25, '시네트롤', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46553, 25, '시서스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46910, 25, '락토페린', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (27, 7, '냉동/간편조리식품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1693, 27, '피자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1694, 27, '핫도그', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1695, 27, '햄버거', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1697, 27, '만두/딤섬', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1699, 27, '샐러드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1700, 27, '어묵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1701, 27, '즉석국/즉석탕', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1702, 27, '튀김류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1703, 27, '기타냉동/간편조리식품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1944, 27, '도시락', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46525, 27, '누룽지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46526, 27, '떡볶이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46527, 27, '맛살/게살', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46528, 27, '스프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46529, 27, '죽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46530, 27, '즉석밥', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46531, 27, '카레/짜장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46532, 27, '함박/미트볼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46900, 27, '동그랑땡/완자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46901, 27, '라이스페이퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46902, 27, '묵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (145, 7, '축산물', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (216, 145, '기타육류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1031, 145, '돼지고기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1032, 145, '쇠고기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1033, 145, '닭고기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1034, 145, '알류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1035, 145, '축산가공식품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46676, 145, '오리고기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46939, 145, '양고기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (146, 7, '반찬', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1733, 146, '장아찌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1734, 146, '장조림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1831, 146, '절임류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1832, 146, '조림류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1833, 146, '반찬세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1834, 146, '기타반찬류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46569, 146, '단무지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46570, 146, '볶음류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46911, 146, '무침류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (147, 7, '김치', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1835, 147, '포기김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1836, 147, '갓김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1837, 147, '총각김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1838, 147, '깍두기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1839, 147, '겉절이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1840, 147, '나박김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1841, 147, '동치미', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1842, 147, '묵은지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1843, 147, '백김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1844, 147, '열무김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1845, 147, '파김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1846, 147, '별미김치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1847, 147, '절임배추', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46524, 147, '오이소박이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (148, 7, '음료', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (945, 148, '청량/탄산음료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (946, 148, '주스/과즙음료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (947, 148, '커피', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (948, 148, '차류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1848, 148, '생수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1849, 148, '탄산수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46606, 148, '건강/기능성음료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46610, 148, '두유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46611, 148, '우유/요거트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46614, 148, '전통/차음료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46631, 148, '코코아', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46632, 148, '파우더/스무디', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (149, 7, '과자/베이커리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1592, 149, '젤리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1593, 149, '푸딩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1594, 149, '캐러멜', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1735, 149, '팝콘/강냉이류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1737, 149, '가공안주류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1738, 149, '기타과자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1816, 149, '초콜릿', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1817, 149, '사탕', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1818, 149, '껌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46520, 149, '아이스크림/빙수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46523, 149, '케이크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46876, 149, '빵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46882, 149, '스낵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46887, 149, '시리얼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46893, 149, '전통과자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (150, 7, '유가공품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (951, 150, '치즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1586, 150, '생크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1587, 150, '마가린', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1588, 150, '버터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46601, 150, '연유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46605, 150, '휘핑크림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (159, 7, '수산물', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (917, 159, '해산물/어패류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (918, 159, '젓갈/장류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (919, 159, '건어물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1036, 159, '생선', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1037, 159, '김/해초', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46585, 159, '수산가공식품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (160, 7, '농산물', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (835, 160, '과일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (920, 160, '쌀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (921, 160, '잡곡/혼합곡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (943, 160, '채소', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (944, 160, '견과류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (959, 160, '건과류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46903, 160, '냉동과일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46421, 7, '밀키트', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46422, 46421, '밥/죽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46423, 46421, '찌개/국', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46424, 46421, '면/파스타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46425, 46421, '구이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46426, 46421, '볶음/튀김', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46427, 46421, '조림/찜', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46428, 46421, '간식/디저트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46429, 46421, '세트요리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46493, 7, '가루/분말류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46494, 46493, '기타분말가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46495, 46493, '밀가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46496, 46493, '부침가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46497, 46493, '빵가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46498, 46493, '쌀가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46499, 46493, '아몬드가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46500, 46493, '오트밀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46501, 46493, '찹쌀가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46502, 46493, '콩가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46503, 46493, '튀김가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46865, 46493, '미숫가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46554, 7, '라면/면류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46555, 46554, '라면', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46558, 46554, '면류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46571, 7, '소스/드레싱', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46572, 46571, '굴소스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46573, 46571, '기타소스/드레싱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46574, 46571, '돈가스소스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46575, 46571, '마요네즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46576, 46571, '머스타드소스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46577, 46571, '발사믹드레싱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46578, 46571, '스테이크/바베큐소스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46579, 46571, '스파게티/파스타소스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46580, 46571, '오리엔탈드레싱', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46581, 46571, '칠리/핫소스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46582, 46571, '케첩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46912, 46571, '쯔유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46913, 46571, '피쉬소스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46591, 7, '식용유/오일', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46592, 46591, '기타기름', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46593, 46591, '대두유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46594, 46591, '들기름', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46595, 46591, '아보카도오일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46596, 46591, '올리브유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46597, 46591, '참기름', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46598, 46591, '카놀라유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46599, 46591, '포도씨유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46600, 46591, '해바라기씨유', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46633, 7, '장류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46634, 46633, '간장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46635, 46633, '고추장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46636, 46633, '기타장류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46637, 46633, '낫토', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46638, 46633, '된장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46639, 46633, '메주', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46640, 46633, '쌈장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46642, 46633, '청국장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46929, 46633, '양념장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46643, 7, '잼/시럽', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46644, 46643, '기타잼/시럽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46645, 46643, '딸기잼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46646, 46643, '땅콩잼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46647, 46643, '메이플시럽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46648, 46643, '사과잼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46649, 46643, '초코시럽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46650, 46643, '초코잼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46651, 46643, '커피시럽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46653, 7, '제과/제빵재료', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46654, 46653, '기타제과/제빵재료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46655, 46653, '베이킹파우더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46656, 46653, '제과/제빵믹스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46657, 46653, '호떡믹스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46658, 7, '조미료', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46659, 46658, '겨자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46660, 46658, '고추냉이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46661, 46658, '고춧가루', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46662, 46658, '기타조미료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46663, 46658, '물엿/올리고당', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46664, 46658, '설탕', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46665, 46658, '소금', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46666, 46658, '식초', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46667, 46658, '액젓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46668, 46658, '천연감미료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46669, 46658, '후추', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46934, 46658, '맛가루/후리가케', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46682, 7, '통조림/캔', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46683, 46682, '골뱅이/번데기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46684, 46682, '기타통조림/캔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46685, 46682, '꽁치/고등어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46686, 46682, '세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46687, 46682, '옥수수/콩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46688, 46682, '참치/연어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46689, 46682, '피클/올리브', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46690, 46682, '햄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46691, 46682, '황도/과일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46698, 7, '주류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46699, 46698, '전통주', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47007, 46698, '맥주', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47008, 46698, '양주', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47091, 7, '떡류', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47092, 47091, '가래떡/떡국떡/절편', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47093, 47091, '기타떡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47094, 47091, '꿀떡/경단', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47095, 47091, '떡케이크/세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47096, 47091, '모찌/찹쌀떡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47097, 47091, '백설기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47098, 47091, '송편', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47099, 47091, '오메기떡/두텁떡', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47100, 47091, '인절미', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (8, NULL, '스포츠/레저', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (22, 8, '당구용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (23, 8, '기타스포츠용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (28, 8, '등산', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (961, 28, '등산의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (962, 28, '등산잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (963, 28, '등산장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1596, 28, '등산화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1597, 28, '등산가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2077, 28, '기타등산장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (29, 8, '캠핑', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (964, 29, '텐트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (965, 29, '랜턴', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (966, 29, '취사용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1154, 29, '기타캠핑용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1598, 29, '타프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1599, 29, '천막', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1602, 29, '침낭', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1917, 29, '캠핑매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45800, 29, '텐트/타프용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45805, 29, '캠핑가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45813, 29, '캠핑왜건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45814, 29, '아이스박스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46859, 29, '워터저그', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46862, 29, '파워뱅크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (30, 8, '골프', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (967, 30, '골프클럽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (968, 30, '골프백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (969, 30, '골프의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (970, 30, '골프잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (971, 30, '골프연습용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (972, 30, '골프필드용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1572, 30, '골프화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1573, 30, '골프공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1574, 30, '로스트볼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46489, 30, '파크골프/그라운드골프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (31, 8, '헬스', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (881, 31, '웨이트기구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (882, 31, '헬스소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1365, 31, '진동운동기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1367, 31, '거꾸리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1368, 31, '벨트마사지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1369, 31, '승마운동기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1438, 31, '헬스사이클', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1439, 31, '아령', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1440, 31, '줄넘기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1441, 31, '훌라후프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1442, 31, '일립티컬', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1443, 31, '스텝퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1444, 31, '트위스트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1445, 31, '트램펄린', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7061, 31, '케틀벨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45818, 31, '로잉머신', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46864, 31, '러닝머신', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47071, 31, '복근운동기구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (32, 8, '요가/필라테스', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (883, 32, '요가복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1370, 32, '요가매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1371, 32, '기타요가용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1372, 32, '필라테스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45829, 32, '요가링/필라테스링', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (34, 8, '스케이트/보드/롤러', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1374, 34, '스케이트보드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1375, 34, '스케이트보드용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1377, 34, '아이스스케이트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1378, 34, '롤러슈즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1379, 34, '킥보드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1908, 34, '핑거보드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46854, 34, '인라인스케이트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46855, 34, '인라인용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (35, 8, '오토바이/스쿠터', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (884, 35, '오토바이부품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (885, 35, '오토바이용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (886, 35, '오토바이의류/잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1381, 35, '오토바이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1942, 35, '전동휠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46856, 35, '스쿠터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (36, 8, '축구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (887, 36, '축구가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1383, 36, '축구화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1384, 36, '풋살화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1385, 36, '축구공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1386, 36, '축구장갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1387, 36, '축구보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1388, 36, '축구양말', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1389, 36, '축구연습용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1390, 36, '기타축구용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47068, 36, '축구의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (37, 8, '야구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1041, 37, '포수장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1279, 37, '야구보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1280, 37, '야구공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1281, 37, '야구양말', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1282, 37, '야구가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1283, 37, '기타야구용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1391, 37, '글러브', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1392, 37, '헬멧', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1393, 37, '야구화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1394, 37, '야구배트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1395, 37, '야구장갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47065, 37, '야구의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (38, 8, '농구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1284, 38, '농구화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1285, 38, '농구대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1286, 38, '농구공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1287, 38, '농구공가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1288, 38, '기타농구용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47058, 38, '농구의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (39, 8, '배구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1289, 39, '배구공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1290, 39, '배구네트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1291, 39, '배구화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1292, 39, '기타배구용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1902, 39, '배구의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (40, 8, '탁구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1195, 40, '기타탁구용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1293, 40, '탁구라켓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1294, 40, '탁구공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1295, 40, '탁구대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1296, 40, '탁구화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1903, 40, '탁구의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46863, 40, '탁구러버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (41, 8, '배드민턴', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1196, 41, '배드민턴라켓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1197, 41, '배드민턴화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1198, 41, '배드민턴가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1199, 41, '셔틀콕', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1200, 41, '스트링', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1201, 41, '그립', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1202, 41, '배드민턴네트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1203, 41, '연습용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1204, 41, '기타배드민턴용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1904, 41, '배드민턴의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42, 8, '테니스', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1205, 42, '테니스라켓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1206, 42, '테니스화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1207, 42, '테니스공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1208, 42, '테니스가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1209, 42, '그립', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1210, 42, '스트링', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1211, 42, '기타테니스용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1905, 42, '테니스의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (43, 8, '스쿼시', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1212, 43, '스쿼시라켓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1213, 43, '스쿼시공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1214, 43, '기타스쿼시용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (44, 8, '족구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1101, 44, '족구공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1102, 44, '족구네트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1103, 44, '족구의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1104, 44, '족구화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1105, 44, '기타족구용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45, 8, '볼링', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1106, 45, '볼링공', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1107, 45, '볼링용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1108, 45, '볼링화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1109, 45, '아대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1110, 45, '볼링가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1906, 45, '볼링의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46, 8, '스킨스쿠버', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1111, 46, '다이빙슈트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1112, 46, '부력재킷', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1113, 46, '부츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1114, 46, '다이빙칼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1115, 46, '글러브', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1116, 46, '게이지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1117, 46, '기어백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1118, 46, '레귤레이터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1119, 46, '리트렉터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1120, 46, '수중전등', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1121, 46, '수중총/작살', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1123, 46, '호스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1124, 46, '납', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1125, 46, '기타스킨스쿠버용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47, 8, '검도', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1126, 47, '죽도', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1127, 47, '죽도집/부속품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1128, 47, '타격대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1129, 47, '도복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1130, 47, '기타검도용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1996, 47, '검도보호용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (48, 8, '댄스', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1131, 48, '댄스소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1933, 48, '댄스복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (49, 8, '권투', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1132, 49, '글러브', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1133, 49, '미트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1134, 49, '샌드백', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2076, 49, '핸드랩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (50, 8, '보호용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1135, 50, '마우스피스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1136, 50, '머리보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1137, 50, '급소보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1138, 50, '몸통보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1139, 50, '배보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1140, 50, '팔보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7054, 50, '테이핑요법', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7055, 50, '손목보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7056, 50, '다리보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7057, 50, '무릎보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7058, 50, '발목보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7059, 50, '허리보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7060, 50, '어깨보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (51, 8, '무술용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1141, 51, '목검/가검', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1142, 51, '봉/곤/창', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1143, 51, '기타무술용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (52, 8, '수련용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1144, 52, '무도복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1145, 52, '수련화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1146, 52, '띠/벨트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1147, 52, '격파용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1149, 52, '기타수련용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (53, 8, '스포츠액세서리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1038, 53, '스코어보드/작전판', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1040, 53, '호각/호루라기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1150, 53, '스포츠선글라스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1152, 53, '스포츠헤어밴드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1153, 53, '스포츠토시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1911, 53, '볼캐리어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1958, 53, '스포츠마스크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1959, 53, '스포츠넥워머', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1960, 53, '아이스머플러/스카프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (161, 8, '자전거', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (973, 161, '자전거/MTB', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (974, 161, '자전거용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (975, 161, '자전거부품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (976, 161, '자전거의류/잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (162, 8, '스키/보드', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (859, 162, '스키장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (860, 162, '보드복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (861, 162, '스노보드장비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (862, 162, '스키/보드방한용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (863, 162, '스키/보드용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (977, 162, '스키복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (163, 8, '낚시', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (864, 163, '낚싯대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (865, 163, '낚시릴', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (866, 163, '낚싯줄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (867, 163, '루어낚시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (868, 163, '민물낚시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (869, 163, '바다낚시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (870, 163, '낚시용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (871, 163, '낚시의류/잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (164, 8, '수영', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (872, 164, '남성수영복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (874, 164, '여성수영복', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (876, 164, '비치웨어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (879, 164, '수영용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47061, 8, '러닝용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47062, 47061, '기타러닝용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47063, 47061, '러닝벨트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47064, 47061, '러닝장갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (9, NULL, '생활/건강', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (54, 9, '화방용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (568, 54, '우드락/폼보드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (799, 54, '서예/동양화용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (800, 54, '미술도구수납용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (801, 54, '미술보조용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (802, 54, '전문지류/미술지류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (803, 54, '페인트/염료/잉크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (804, 54, '붓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (805, 54, '물감/포스터컬러', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (806, 54, '스케치/드로잉용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (807, 54, '애니메이션용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (808, 54, '조소/판화용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (55, 9, '자동차용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (809, 55, 'DIY용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (810, 55, '램프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (812, 55, '배터리용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (813, 55, '공기청정용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (814, 55, '세차용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (815, 55, '키용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (816, 55, '편의용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (817, 55, '오일/소모품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (818, 55, '익스테리어용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (819, 55, '인테리어용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (820, 55, '전기용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (821, 55, '수납용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (822, 55, '휴대폰용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (823, 55, '타이어/휠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (824, 55, '튜닝용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (56, 9, '수집품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (347, 56, '서예/글씨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (348, 56, 'LP', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (349, 56, '공예품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (350, 56, '포스터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (351, 56, '이색수집품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (825, 56, '게임', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (826, 56, '퍼즐/블록', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (827, 56, '모형/프라모델/피규어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (828, 56, '무선/RC', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (829, 56, '서바이벌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (830, 56, '화폐', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (831, 56, '우표/씰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (833, 56, '코스튬플레이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2041, 56, '아이돌굿즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (57, 9, '관상어용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (352, 57, '사료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (353, 57, '수조장식용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (354, 57, '수조청소용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (355, 57, '수족관/어항', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (356, 57, '수초', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (357, 57, '에어/기포', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (358, 57, '모터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (359, 57, '히터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (360, 57, '조명', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (361, 57, '여과기/여과재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (58, 9, '음반', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (230, 58, '국내앨범', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (231, 58, '해외앨범', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (59, 9, 'DVD', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (232, 59, '애니메이션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (233, 59, '뮤직비디오', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (234, 59, '취미/스포츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (235, 59, '종교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (236, 59, '교육', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (237, 59, '교양/다큐멘터리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (238, 59, '유아/어린이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (756, 59, '영화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (757, 59, '드라마', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (60, 9, '종교', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (239, 60, '불교용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (240, 60, '천주교용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (241, 60, '기독교용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (61, 9, '주방용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (217, 61, '도마', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (758, 61, '식기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (759, 61, '잔/컵', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (760, 61, '냄비/솥', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (761, 61, '프라이팬', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (762, 61, '주전자/티포트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (763, 61, '보관/밀폐용기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (764, 61, '칼/커팅기구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (765, 61, '교자상/밥상', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (766, 61, '주방수납용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (767, 61, '조리기구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (768, 61, '커피용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (769, 61, '와인용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (770, 61, '제과/제빵용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (771, 61, '주방잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (772, 61, '제수용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (62, 9, '세탁용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (778, 62, '빨래건조대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1850, 62, '다림판', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1851, 62, '다림풀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1852, 62, '빨래바구니', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1853, 62, '빨래삶통', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1854, 62, '빨랫줄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1855, 62, '빨래집게', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1856, 62, '빨래판', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1857, 62, '세탁망', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1858, 62, '세탁볼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1859, 62, '세탁솔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1860, 62, '세탁잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (63, 9, '건강측정용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (779, 63, '체중계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1861, 63, '만보계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1862, 63, '신장계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1863, 63, '체온계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1864, 63, '혈압계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1865, 63, '심박계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1866, 63, '청진기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (64, 9, '건강관리용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1867, 64, '건강목걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1868, 64, '건강팔찌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1869, 64, '금연용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1870, 64, '뜸/뜸기구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1871, 64, '수지침', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1872, 64, '먼지차단마스크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1873, 64, '풋/레그패치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1874, 64, '지압기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1875, 64, '코건강용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1876, 64, '코클리너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1877, 64, '파라핀용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1878, 64, '기타건강관리용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1938, 64, '전자담배', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1939, 64, '전자담배 액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2010, 64, '소음방지귀마개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45797, 64, '위생마스크', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45798, 64, '마스크액세서리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (65, 9, '당뇨관리용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1879, 65, '침/바늘', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1880, 65, '혈당측정지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1881, 65, '혈당계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (66, 9, '의료용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1882, 66, '거즈/붕대/솜류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1883, 66, '구급/응급용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1884, 66, '석션기/네블라이저', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1885, 66, '핀셋/포셉/겸자류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1907, 66, '의료용가구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (67, 9, '실버용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (780, 67, '휠체어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1761, 67, '보행보조용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1762, 67, '보행차/실버카', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1763, 67, '목욕보조용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1764, 67, '배변보조용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1765, 67, '욕창방지용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1766, 67, '장례용품/수의', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1886, 67, '돋보기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1887, 67, '보청기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (68, 9, '재활운동용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1768, 68, '목보호대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1775, 68, '자세교정용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1776, 68, '의료용압박스타킹', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1777, 68, '재활운동기구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1778, 68, '기타재활운동용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7050, 68, '상반신보조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7051, 68, '하반신보조기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (69, 9, '물리치료/저주파용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1739, 69, '저주파안마기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1740, 69, '저주파자극기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1741, 69, '저주파패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1742, 69, '적외선조사기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1743, 69, '디스크/관절용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1744, 69, '부항기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1745, 69, '물리치료용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (70, 9, '좌욕/좌훈용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1746, 70, '좌욕기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1747, 70, '좌훈기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (71, 9, '냉온/찜질용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1748, 71, '찜질기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1749, 71, '찜질팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (72, 9, '구강위생용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1750, 72, '구강청정제/가글', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1751, 72, '치실/치간칫솔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1752, 72, '치아미백제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1753, 72, '치약', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1754, 72, '칫솔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1755, 72, '칫솔치약세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1756, 72, '혀클리너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1757, 72, '마우스피스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1758, 72, '틀니관리용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1759, 72, '치석제거기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (73, 9, '눈건강용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1644, 73, '렌즈세정액', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1645, 73, '렌즈세척기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1646, 73, '안대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1760, 73, '기타렌즈용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (74, 9, '발건강용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1647, 74, '건강슬리퍼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1648, 74, '다리/발마사지기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1649, 74, '발지압/발매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1650, 74, '족욕/족탕기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1651, 74, '발보호대/패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1652, 74, '발가락교정기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1653, 74, '발냄새제거제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1654, 74, '발각질제거기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (75, 9, '안마용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1655, 75, '안마의자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1657, 75, '안마기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1658, 75, '쿠션안마기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1659, 75, '안마매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1660, 75, '기타안마용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46838, 75, '마사지건', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (76, 9, '수납/정리용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (781, 76, '선반/진열대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (782, 76, '정리함', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (783, 76, '옷걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1662, 76, '소품걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1663, 76, '옷커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1664, 76, '압축팩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1665, 76, '선풍기커버', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1920, 76, '마네킹', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47028, 76, '바구니', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (77, 9, '청소용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (784, 77, '휴지통', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1666, 77, '밀대/패드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1667, 77, '빗자루/쓰레받기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1668, 77, '걸레', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1669, 77, '먼지떨이/먼지제거기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1670, 77, '솔', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1671, 77, '유리닦이용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1672, 77, '테이프클리너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1673, 77, '회전청소기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1674, 77, '매직블럭', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1675, 77, '기타청소용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (78, 9, '생활용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (785, 78, '화장지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (786, 78, '생리대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (787, 78, '성인용기저귀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (788, 78, '세제/세정제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (789, 78, '섬유유연제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (790, 78, '제습/방향/탈취', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (791, 78, '해충퇴치용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (792, 78, '생활잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (793, 78, '보안용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1608, 78, '생활선물세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (79, 9, '원예/식물', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1609, 79, '공기정화식물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1610, 79, '관엽식물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1611, 79, '다육식물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1612, 79, '수경식물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1613, 79, '식용식물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1614, 79, '넝쿨식물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1615, 79, '허브식물', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1616, 79, '천연잔디', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1617, 79, '미니화분', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1618, 79, '분재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1619, 79, '숯부작', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1620, 79, '토피어리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1632, 79, '씨앗/모종', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1633, 79, '조화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1634, 79, '보존화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1635, 79, '금꽃', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1636, 79, '비누꽃', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1637, 79, '종이꽃', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2000, 79, '플라워소품만들기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (2001, 79, '테라리엄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (80, 9, '정원/원예용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1621, 80, '물조리개', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1622, 80, '수반', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1623, 80, '원예부자재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1624, 80, '자갈/모래/흙', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1625, 80, '정원데코', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1626, 80, '정원부자재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1627, 80, '조경수/묘목', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1628, 80, '화분', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1629, 80, '화분대', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1630, 80, '화분받침', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1631, 80, '화분영양제/비료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (81, 9, '블루레이', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (794, 81, '영화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (795, 81, '드라마', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1521, 81, '유아/어린이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1638, 81, '애니메이션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1639, 81, '뮤직비디오', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1640, 81, '취미/스포츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1641, 81, '종교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1642, 81, '교육', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1643, 81, '교양/다큐멘터리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (155, 9, '반려동물', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (229, 155, '기타반려동물용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1964, 155, '강아지 사료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1965, 155, '강아지 간식', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1966, 155, '강아지 배변용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1967, 155, '강아지 건강/관리용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1968, 155, '미용/목욕', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1970, 155, '강아지 장난감/훈련', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1971, 155, '고양이 사료', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1972, 155, '고양이 간식', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1973, 155, '고양이 배변용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1974, 155, '고양이 건강/관리용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1977, 155, '고양이 장난감', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1978, 155, '리빙용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1979, 155, '패션용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1980, 155, '식기/급수기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42812, 155, '서비스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46819, 155, '소동물용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46824, 155, '외출용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46834, 155, '캣타워/스크래쳐', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (156, 9, '악기', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (748, 156, '기타(guitar)', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (749, 156, '건반악기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (750, 156, '현악기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (751, 156, '관악기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (752, 156, '타악기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (753, 156, '국악기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (754, 156, '음향기자재', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (755, 156, '기타악기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (834, 156, '피아노', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (157, 9, '욕실용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (773, 157, '비데/비데용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (774, 157, '욕조/반신욕용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (775, 157, '욕실잡화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (777, 157, '면도용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42813, 157, '욕실청소용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42814, 157, '샤워/목욕용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42815, 157, '수건/타월', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42816, 157, '욕실장/선반', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42817, 157, '욕실용기/홀더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42818, 157, '욕실발판/욕실매트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42819, 157, '위생도기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47034, 157, '샤워기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47042, 157, '세면대/수전용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47050, 157, '욕실화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (158, 9, '문구/사무용품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (797, 158, '제도용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (798, 158, '이벤트/파티용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (907, 158, '다이어리/플래너', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (908, 158, '노트/수첩', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (909, 158, '필기도구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (910, 158, '앨범', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (911, 158, '보드/칠판', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (912, 158, '데스크용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (915, 158, '용지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (916, 158, '사무기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42802, 158, '스티커', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42803, 158, '스탬프/도장', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42804, 158, '문구용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42807, 158, '파일/바인더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42808, 158, '지도/지구본', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42809, 158, '카드/엽서/봉투', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (42811, 158, '사무용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47010, 158, '독서용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47020, 158, '테이프', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (165, 9, '공구', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (888, 165, '목공공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (889, 165, '설비공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (890, 165, '용접공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (891, 165, '예초기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (892, 165, '원예공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (893, 165, '에어공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (894, 165, '수작업공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (895, 165, '전동공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (896, 165, '절삭공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (897, 165, '측정공구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (898, 165, '소형기계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (899, 165, '안전용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (900, 165, '전기용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (901, 165, '접착용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (902, 165, '체결용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (903, 165, '페인트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (904, 165, '페인트용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (905, 165, '운반용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (906, 165, '포장용품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47006, 9, '자동차', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10, NULL, '여가/생활편의', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (5196, 10, '원데이클래스', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7047, 5196, '수공예 클래스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (7048, 5196, '쿠킹 클래스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (30696, 5196, '기타클래스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10189, 10, '국내여행/체험', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10192, 10189, '공연/티켓', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10193, 10189, '액티비티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (11999, 10189, '국내패키지/기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12000, 10189, '국내숙박', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10190, 10, '해외여행', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12002, 10190, '해외패키지/기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12003, 10190, '해외숙박', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46743, 10190, '이동/교통편의', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46748, 10190, '입장권', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (47102, 10190, '와이파이/USIM', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10191, 10, '국내렌터카', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12006, 10191, '장기렌터카', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12007, 10191, '단기렌터카', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10194, 10, '생활편의', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12028, 10194, 'e쿠폰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12029, 10194, '사진/영상 촬영', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12030, 10194, '지류/카드 상품권', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12031, 10194, '온라인 콘텐츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12048, 10194, '꽃/케이크배달', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10195, 10, '예체능레슨', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12032, 10195, '무예/무도', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12033, 10195, '골프레슨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12034, 10195, '구기 스포츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12035, 10195, '아웃도어스포츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12036, 10195, '댄스/무용', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12037, 10195, '보컬/악기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12038, 10195, '미술', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12039, 10195, '피트니스/PT', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12040, 10195, '필라테스/요가', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12041, 10195, '기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10196, 10, '자기계발/취미 레슨', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12042, 10196, '외국어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12043, 10196, '공예', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12044, 10196, '뷰티', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12045, 10196, '커피/요리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12046, 10196, '취업/자격증/기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (10197, 10, '홈케어서비스', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12049, 10197, '가전/가구 설치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (12050, 10197, '이사/청소', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (11, NULL, '면세점', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (14, 11, '화장품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (673, 14, '스킨케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (674, 14, '메이크업', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1492, 14, '클렌징', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1493, 14, '선케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1494, 14, '바디케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1495, 14, '헤어케어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1496, 14, '남성화장품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1497, 14, '아동화장품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (15, 11, '향수', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1498, 15, '여성향수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1499, 15, '남성향수', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (16, 11, '시계/기프트', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (675, 16, '시계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1500, 16, '필기도구', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1501, 16, '라이터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1502, 16, '크리스탈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1503, 16, '수첩/다이어리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1504, 16, '생활소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (17, 11, '주얼리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1505, 17, '귀걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1506, 17, '목걸이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1507, 17, '반지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1508, 17, '팬던트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1509, 17, '팔찌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1510, 17, '발찌', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1511, 17, '헤어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1512, 17, '넥타이핀', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1513, 17, '커프스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1514, 17, '브로치', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1515, 17, '키홀더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1516, 17, '휴대폰줄', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1517, 17, '장식소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (18, 11, '패션/잡화', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (676, 18, '가방', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (677, 18, '지갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (678, 18, '의류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (679, 18, '신발', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1396, 18, '넥타이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1397, 18, '스카프/머플러', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1398, 18, '언더웨어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1399, 18, '모자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1400, 18, '장갑', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1401, 18, '양말', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1402, 18, '우산/양산', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1403, 18, '패션소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1404, 18, '여행소품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1518, 18, '벨트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1519, 18, '선글라스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1520, 18, '안경', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (19, 11, '전자제품', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (680, 19, '카메라/캠코더', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (681, 19, '가전제품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (682, 19, 'MP3/이어폰/헤드폰', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1405, 19, '노트북/주변기기', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1446, 19, '기타 전자제품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (20, 11, '식품/건강', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1447, 20, '건강식품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1448, 20, '홍삼/인삼', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (1449, 20, '기호식품', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45830, NULL, '도서', 1);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45831, 45830, '소설', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45857, 45831, '세계 각국 소설', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45858, 45831, '고전/문학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45859, 45831, '장르소설', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45860, 45831, '테마문학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45985, 45831, '한국소설', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45995, 45831, '비평/창작/이론', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46006, 45831, '희곡/시나리오', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46007, 45831, '신화/전설/설화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46443, 45831, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46444, 45831, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45832, 45830, '시/에세이', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45861, 45832, '명사/연예인 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45862, 45832, '여행 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45863, 45832, '성공 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45864, 45832, '독서 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45865, 45832, '명상 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45866, 45832, '그림/사진 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45867, 45832, '연애/사랑 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45868, 45832, '명언/잠언록', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45986, 45832, '예술 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46004, 45832, '음식/요리 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46452, 45832, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46453, 45832, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46454, 45832, '외국 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46455, 45832, '외국시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46456, 45832, '한국 에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46457, 45832, '한국시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45833, 45830, '인문', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45869, 45833, '인문일반', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45870, 45833, '심리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45871, 45833, '철학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45872, 45833, '언어학/기호학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45873, 45833, '종교학/신화학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46472, 45833, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46473, 45833, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45834, 45830, '가정/요리', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45874, 45834, '결혼/가족', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45875, 45834, '임신/출산', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45876, 45834, '자녀교육', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45877, 45834, '인테리어/살림', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45878, 45834, '요리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45983, 45834, '육아', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46431, 45834, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46432, 45834, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45835, 45830, '경제/경영', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45879, 45835, '경제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45880, 45835, '경영', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45881, 45835, '마케팅/세일즈', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45882, 45835, '재테크/투자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46009, 45835, 'CEO/비즈니스맨', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46436, 45835, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46437, 45835, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45836, 45830, '자기계발', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45883, 45836, '성공/처세', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45884, 45836, '시간관리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45885, 45836, '자기능력계발', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45886, 45836, '인간관계', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45887, 45836, '대화/협상', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45987, 45836, '취업', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46474, 45836, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46475, 45836, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45837, 45830, '사회/정치', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45888, 45837, '정치/외교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45889, 45837, '행정', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45890, 45837, '국방/군사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45891, 45837, '법', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45892, 45837, '사회학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45893, 45837, '사회복지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45894, 45837, '언론/미디어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45990, 45837, '여성학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45991, 45837, '교육학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46441, 45837, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46442, 45837, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45838, 45830, '역사', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45895, 45838, '역사학/이론/비평', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45896, 45838, '세계사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45897, 45838, '서양사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45898, 45838, '동양사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45899, 45838, '한국사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45996, 45838, '주제별 역사/문화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46462, 45838, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46463, 45838, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45839, 45830, '종교', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45900, 45839, '종교일반', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45901, 45839, '개신교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45902, 45839, '천주교(가톨릭)', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45903, 45839, '불교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45904, 45839, '기타 종교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46479, 45839, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45840, 45830, '예술/대중문화', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45905, 45840, '예술일반/예술사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45906, 45840, '미술', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45907, 45840, '음악', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45908, 45840, '건축', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45909, 45840, '만화/애니메이션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45910, 45840, '사진', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45911, 45840, '연극/공연/영화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45912, 45840, 'TV/라디오', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46464, 45840, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46465, 45840, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45841, 45830, '국어/외국어', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45913, 45841, '국어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45914, 45841, '영어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45915, 45841, '일본어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45916, 45841, '중국어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45917, 45841, '기타외국어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46027, 45841, '기타 국가 사전', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46028, 45841, '백과/전문사전', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46030, 45841, '한자사전', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46438, 45841, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46439, 45841, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45842, 45830, '자연/과학', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45918, 45842, '수학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45919, 45842, '물리학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45920, 45842, '화학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45921, 45842, '생물학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45922, 45842, '천문/지구과학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45923, 45842, '도시/토목/건설', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45924, 45842, '공학일반/산업공학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45925, 45842, '기계/전기/전자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45926, 45842, '농수산/축산', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46026, 45842, '과학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46476, 45842, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46477, 45842, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45843, 45830, '수험서/자격증', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45927, 45843, '취업/상식/적성검사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45928, 45843, '공무원', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45929, 45843, '고등고시/전문직', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45930, 45843, '검정고시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46031, 45843, '경제/금융/회계/물류', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46032, 45843, '편입/대학원', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46033, 45843, '컴퓨터수험서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46035, 45843, '교원임용고시', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46037, 45843, '공인중개/주택관리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46039, 45843, '국가자격/전문사무', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46041, 45843, '독학사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46445, 45843, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46446, 45843, '보건/위생/의학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45844, 45830, '여행', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45931, 45844, '국내여행', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45932, 45844, '해외여행', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45933, 45844, '테마여행', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45934, 45844, '지도', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46461, 45844, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45845, 45830, '컴퓨터/IT', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45935, 45845, '그래픽/멀티미디어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45936, 45845, '오피스활용도서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46020, 45845, 'OS/데이터베이스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46029, 45845, '컴퓨터 입문/활용', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46034, 45845, '네트워크/보안', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46040, 45845, '게임', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46042, 45845, '웹사이트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46044, 45845, '프로그래밍 언어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46045, 45845, '컴퓨터공학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46482, 45845, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45846, 45830, '잡지', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45937, 45846, '자연/공학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45938, 45846, '컴퓨터/게임/그래픽', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45939, 45846, '어학/고시/교육', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45940, 45846, '연예/영화/만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45941, 45846, '여행/취미/스포츠', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45942, 45846, '외국잡지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46005, 45846, '경제/시사', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46013, 45846, '예술/사진/건축', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46015, 45846, '여성/남성/패션', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46016, 45846, '리빙/육아', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46036, 45846, '요리/건강', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46046, 45846, '종교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46390, 45846, '문예/교양지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46478, 45846, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45847, 45830, '청소년', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45943, 45847, '학습법/진학 가이드', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45944, 45847, '청소년 경제/자기계발', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45945, 45847, '청소년 문학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45946, 45847, '청소년 인문/사회', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45947, 45847, '청소년 예술', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45948, 45847, '청소년 과학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46025, 45847, '논술/면접대비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46480, 45847, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46481, 45847, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45848, 45830, '유아', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45951, 45848, '유아놀이책', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45952, 45848, '유아그림책', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45953, 45848, '유아학습', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46467, 45848, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46468, 45848, '정가제free', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45849, 45830, '어린이', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45957, 45849, '어린이영어', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45989, 45849, '학습/학습만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46038, 45849, '어린이 문학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46043, 45849, '어린이 교양', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46047, 45849, '어린이 세트', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46458, 45849, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46459, 45849, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46460, 45849, '정가제free', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45850, 45830, '만화', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45958, 45850, '교양만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45959, 45850, '드라마', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45960, 45850, '성인만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45961, 45850, '순정만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45962, 45850, '스포츠만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45963, 45850, 'SF/판타지', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45964, 45850, '액션/무협만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45965, 45850, '명랑/코믹만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45966, 45850, '공포/추리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45967, 45850, '학원만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45968, 45850, '웹툰/카툰에세이', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45969, 45850, '기타만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45970, 45850, '일본어판 만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46389, 45850, '영문판 만화', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46440, 45850, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45851, 45830, '외국도서', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45971, 45851, '문학/소설', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45972, 45851, '유아청소년/교육', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45973, 45851, '경영경제', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45974, 45851, '건축/예술', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45975, 45851, '요리', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45976, 45851, '취미/여행', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45977, 45851, '외국어/사전', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45978, 45851, '자연/과학', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45979, 45851, '스페인', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45980, 45851, '일본도서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46048, 45851, '인문/사회/종교', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46410, 45851, '가족/생활', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46411, 45851, '컴퓨터', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46412, 45851, '독일', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46413, 45851, '프랑스', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46466, 45851, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45852, 45830, '건강/취미', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45981, 45852, '건강', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45984, 45852, '취미/레저', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46433, 45852, 'eBook', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46434, 45852, '오디오북', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46435, 45852, '정가제free', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45853, 45830, '중학교 참고서', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45997, 45853, '중1 자습서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45998, 45853, '중1 문제집', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45999, 45853, 'EBS 중등', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46008, 45853, '중2 자습서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46017, 45853, '중2 문제집', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46021, 45853, '중3 자습서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46022, 45853, '중3 문제집', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46023, 45853, '특목고 대비', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46024, 45853, '기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46415, 45853, '예비 고1', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45854, 45830, '고등학교 참고서', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45982, 45854, '자습서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45988, 45854, '수능문제집', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45992, 45854, '문제집', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45993, 45854, '기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46014, 45854, 'EBS 고등', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45855, 45830, '초등학교 참고서', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46000, 45855, '초등2학년', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46001, 45855, '초등4학년', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46002, 45855, '초등5학년', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46003, 45855, '초등6학년', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46010, 45855, '초등1학년', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46011, 45855, '초등3학년', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46012, 45855, '한글/한자', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46018, 45855, 'EBS 초등', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46019, 45855, '기타', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (45856, 45830, '중고도서', 2);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46049, 45856, '도서', 3);
INSERT INTO trend_category (trend_category_id, parent_category_id, trend_category_name, depth)
VALUES (46050, 45856, '만화', 3);


-- ============================================
-- 6. 반복 규칙 (recurrence_rule)
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
 NOW(), DATE_ADD(NOW(), INTERVAL 6 MONTH), NOW(), NOW()),

-- DAILY for workflow 3
(3, 'DAILY', 1, NULL, NULL, '["09:00", "18:00"]', '매일 09:00, 18:00에 실행',
 NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR), NOW(), NOW()),

-- DAILY for workflow 4
(4, 'DAILY', 1, NULL, NULL, '["09:00", "18:00"]', '매일 09:00, 18:00에 실행',
 NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR), NOW(), NOW()),

-- DAILY for workflow 5
(5, 'DAILY', 1, NULL, NULL, '["09:00", "18:00"]', '매일 09:00, 18:00에 실행',
 NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR), NOW(), NOW());

-- ============================================
-- 7. 워크플로우 (workflow)
-- ============================================
INSERT INTO `workflow` (`workflow_id`,`user_id`, `user_blog_id`, `trend_category_id`, `recurrence_rule_id`, `status`, `site_url`, `test_status`,`deleted_at`, `created_at`, `updated_at`)
VALUES
(1, 2, 1, 5, 1, 'PENDING', 'https://www.musinsa.com', 'NOT_TESTED',NULL, NOW(), NOW()),
(2, 2, 2, 6, 2, 'PENDING', 'https://www.gmarket.co.kr', 'NOT_TESTED',NULL, NOW(), NOW()),
(3, 2, 3, 3, 3, 'PENDING', 'https://www.29cm.co.kr', 'NOT_TESTED',NULL, NOW(), NOW()),
(4, 2, 4, 4, 4, 'ACTIVE', 'https://www.oliveyoung.co.kr', 'NOT_TESTED',NULL, NOW(), NOW()),
(5, 2, 5, 6, 5, 'ACTIVE', 'https://www.11st.co.kr', 'NOT_TESTED',NULL, NOW(), NOW());

-- ============================================
-- 8. 작업 (work)
-- ============================================
INSERT INTO `work` (`work_id`, `workflow_id`, `status`, `posting_url`, `started_at`, `completed_at`, `view_count`, `created_at`, `updated_at`)
VALUES (1, 1, 'COMPLETED', 'https://blog.naver.com/user123/123456', DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), 152, NOW(), NOW()),
       (2, 1, 'COMPLETED', 'https://blog.naver.com/user123/123457', DATE_SUB(NOW(), INTERVAL 8 DAY), DATE_SUB(NOW(), INTERVAL 8 DAY), 95, NOW(), NOW()),
       (3, 2, 'COMPLETED', 'https://admin.tistory.com/123', DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), 287, NOW(), NOW()),
       (4, 2, 'COMPLETED', 'https://admin.tistory.com/124', DATE_SUB(NOW(), INTERVAL 9 DAY), DATE_SUB(NOW(), INTERVAL 9 DAY), 143, NOW(), NOW()),
       (5, 1, 'COMPLETED', 'https://blog.naver.com/user123/123458', DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_SUB(NOW(), INTERVAL 10 DAY), 221, NOW(), NOW()),
       (6, 3, 'COMPLETED', 'https://blog.naver.com/user123/234567', DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY), 89, NOW(), NOW()),
       (7, 3, 'COMPLETED', 'https://blog.naver.com/user123/234568', DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY), 124, NOW(), NOW()),
       (8, 4, 'COMPLETED', 'https://blog.naver.com/user123/345678', DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY), 203, NOW(), NOW()),
       (9, 4, 'COMPLETED', 'https://blog.naver.com/user123/345679', DATE_SUB(NOW(), INTERVAL 11 DAY), DATE_SUB(NOW(), INTERVAL 11 DAY), 168, NOW(), NOW()),
       (10, 5, 'COMPLETED', 'https://blog.naver.com/user123/456789', DATE_SUB(NOW(), INTERVAL 6 DAY), DATE_SUB(NOW(), INTERVAL 6 DAY), 176, NOW(), NOW()),
       (11, 5, 'COMPLETED', 'https://blog.naver.com/user123/456790', DATE_SUB(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 7 DAY), 312, NOW(), NOW());

-- ============================================
-- 9. 상품 크롤링 (product_crawl)
-- ============================================
INSERT INTO `product_crawl` (`product_crawl_id`, `site_name`, `site_url`, `product_name`, `product_code`,
                             `product_detail_url`, `product_price`, `started_at`, `completed_at`, `created_at`, `updated_at`)
VALUES (1, '쿠팡', 'https://www.coupang.com', '여름 원피스', 'PROD001', 'https://www.coupang.com/products/12345', 29900, NOW(), NOW(), NOW(), NOW()),
       (2, '쿠팡', 'https://www.coupang.com', '갤럭시 S24', 'PROD002', 'https://www.coupang.com/products/67890', 999000, NOW(), NOW(), NOW(), NOW()),
       (3, '11번가', 'https://www.11st.co.kr', '봄 원피스', 'PROD003', 'https://www.11st.co.kr/products/11111', 35000, NOW(), NOW(), NOW(), NOW()),
       (4, '11번가', 'https://www.11st.co.kr', '아이폰 15', 'PROD004', 'https://www.11st.co.kr/products/22222', 1200000, NOW(), NOW(), NOW(), NOW());

-- ============================================
-- 10. AI 콘텐츠 (ai_content)
-- ============================================
INSERT INTO `ai_content` (`ai_content_id`, `work_id`, `title`, `content`, `status`, `choice_product`,
                          `choice_trend_keyword`, `started_at`, `completed_at`, `created_at`, `updated_at`)
VALUES (1, 1, '2024 여름 원피스 추천', '올 여름 트렌디한 원피스를 소개합니다...', 'PUBLISHED', 'PROD001', '여름원피스', '2025-12-13 10:00:00', '2025-12-13 10:00:00', NOW(), NOW()),
       (2, 3, '갤럭시 S24 완벽 리뷰', '최신 갤럭시 S24의 모든 것을 알아봅니다...', 'PUBLISHED', 'PROD002', '갤럭시S24', '2025-12-13 14:00:00', '2025-12-13 14:00:00', NOW(), NOW()),
       (3, 6, '가을 여성패션 트렌드 2024', '올 가을 여성패션 필수 아이템을 소개합니다...', 'PUBLISHED', 'PROD003', '가을패션', '2025-12-14 09:00:00', '2025-12-14 09:00:00', NOW(), NOW()),
       (4, 7, '데일리 여성 코디 추천', '데일리로 입기 좋은 여성 코디를 추천합니다...', 'PUBLISHED', 'PROD003', '데일리룩', '2025-12-14 12:00:00', '2025-12-14 12:00:00', NOW(), NOW()),
       (5, 8, '아이폰 15 vs 갤럭시 S24 비교', '최신 스마트폰 두 모델을 비교 분석합니다...', 'PUBLISHED', 'PROD004', '스마트폰비교', '2025-12-14 16:00:00', '2025-12-14 16:00:00', NOW(), NOW()),
       (6, 10, '갤럭시 S24 카메라 성능 리뷰', '갤럭시 S24의 카메라 성능을 상세히 리뷰합니다...', 'PUBLISHED', 'PROD002', '카메라리뷰', '2025-12-15 11:00:00', '2025-12-15 11:00:00', NOW(), NOW()),
       (7, 11, '2024 최고의 플래그십 스마트폰', '올해의 최고 플래그십 스마트폰을 소개합니다...', 'PUBLISHED', 'PROD002', '플래그십폰', '2025-12-15 15:00:00', '2025-12-15 15:00:00', NOW(), NOW());

-- ============================================
-- 11. 작업 상세 로그 (work_detail_log)
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
-- 12. AI 사용 로그 (ai_usage_log)
-- ============================================
INSERT INTO `ai_usage_log` (`usage_log_id`, `work_id`, `user_id`, `feature_type`, `model`, `prompt_tokens`,
                            `completion_tokens`, `total_tokens`, `estimated_cost`, `created_at`, `updated_at`)
VALUES (1, 1, 2, 'CONTENT_GENERATION', 'gpt-4', 150, 500, 650, 0.013000, NOW(), NOW()),
       (2, 3, 2, 'CONTENT_GENERATION', 'gpt-4', 200, 600, 800, 0.016000, NOW(), NOW()),
       (3, 6, 2, 'CONTENT_GENERATION', 'gpt-4', 180, 550, 730, 0.014600, NOW(), NOW()),
       (4, 7, 2, 'CONTENT_GENERATION', 'gpt-4', 160, 520, 680, 0.013600, NOW(), NOW()),
       (5, 8, 2, 'CONTENT_GENERATION', 'gpt-4', 190, 580, 770, 0.015400, NOW(), NOW()),
       (6, 10, 2, 'CONTENT_GENERATION', 'gpt-4', 170, 540, 710, 0.014200, NOW(), NOW()),
       (7, 11, 2, 'CONTENT_GENERATION', 'gpt-4', 200, 600, 800, 0.016000, NOW(), NOW());

-- ============================================
-- 13. 공지사항 (notice)
-- ============================================
INSERT INTO `notice` (`notice_id`, `title`, `content`, `announcement_type`, `is_important`, `author_id`, `view_count`,
                      `attachment_url`, `created_at`, `updated_at`)
VALUES (1, '서비스 오픈 안내', '안녕하세요. 서비스가 정식 오픈되었습니다.', 'GENERAL', TRUE, 2, 0, NULL, NOW(), NOW()),
       (2, '정기 점검 안내', '매주 월요일 새벽 2시~4시 정기 점검이 진행됩니다.', 'GENERAL', FALSE, 2, 0, NULL, NOW(), NOW());

-- ============================================
-- 14. 공지사항 첨부파일 (notice_file)
-- ============================================
INSERT INTO `notice_file` (`file_id`, `notice_id`, `file_name`, `original_name`, `file_url`, `file_size`, `file_type`,
                           `created_at`, `updated_at`)
VALUES (1, 1, 'service_guide.pdf', '서비스 가이드.pdf', 'https://storage.example.com/files/service_guide.pdf', 1024000,
        'application/pdf', NOW(), NOW());

-- ============================================
-- 15. 사용자 정지 (user_suspension)
-- ============================================
INSERT INTO `user_suspension` (`suspension_id`, `user_id`, `suspended_user_id`, `reason`, `suspended_at`,
                               `unsuspended_at`, `is_active`, `created_at`, `updated_at`)
VALUES (1, 2, 1, '테스트 정지 (해제됨)', DATE_SUB(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), FALSE, NOW(), NOW());

-- ============================================
-- 16. 공통 코드 그룹 (common_code_group)
-- ============================================
INSERT INTO `common_code_group` (`group_id`, `group_name`, `description`, `created_at`, `updated_at`)
VALUES ('EXECUTION_STATUS', '실행 상태', '실행 상태', NOW(), NOW()),
       ('CONTENT_STATUS', 'AI 콘텐츠 생성 상태', 'AI 콘텐츠 생성 상태', NOW(), NOW()),
       ('POST_STATUS', '블로그 포스트 발행 상태', '블로그 포스트 발행 상태', NOW(), NOW()),
       ('AUTH_PROVIDER', '인증 제공자', '인증 제공자', NOW(), NOW()),
       ('USER_ROLE', '사용자 권한', '사용자 권한', NOW(), NOW()),
       ('USER_STATUS', '사용자 계정 상태', '사용자 계정 상태', NOW(), NOW()),
       ('REPEAT_TYPE', '반복 유형', '반복 유형', NOW(), NOW()),
       ('WORKFLOW_STATUS', '워크플로우 상태', '워크플로우 상태', NOW(), NOW()),
       ('LOG_LEVEL', '로그 레벨', '로그 레벨', NOW(), NOW()),
       ('STEP_STATUS', '단계 실행 상태', '단계 실행 상태', NOW(), NOW()),
       ('SITE_URL_INFO', '쇼핑몰 사이트 정보', '쇼핑몰 사이트 정보', NOW(), NOW());

-- ============================================
-- 17. 공통 코드 (common_code)
-- ============================================
INSERT INTO `common_code` (`code_id`, `group_id`, `code_name`, `description`, `sort_order`, `is_active`, `created_at`,
                           `updated_at`)
VALUES
-- EXECUTION_STATUS
('PENDING', 'EXECUTION_STATUS', '대기', '실행 대기 중', 1, TRUE, NOW(), NOW()),
('RUNNING', 'EXECUTION_STATUS', '실행중', '실행 중', 2, TRUE, NOW(), NOW()),
('COMPLETED', 'EXECUTION_STATUS', '완료', '실행 완료', 3, TRUE, NOW(), NOW()),
('FAILED', 'EXECUTION_STATUS', '실패', '실행 실패', 4, TRUE, NOW(), NOW()),
-- CONTENT_STATUS
('CONTENT_PENDING', 'CONTENT_STATUS', '대기', 'AI 생성 대기 중', 1, TRUE, NOW(), NOW()),
('GENERATING', 'CONTENT_STATUS', '생성중', 'AI가 콘텐츠 생성 중', 2, TRUE, NOW(), NOW()),
('GENERATED', 'CONTENT_STATUS', '생성완료', 'AI 콘텐츠 생성 완료', 3, TRUE, NOW(), NOW()),
('APPROVED', 'CONTENT_STATUS', '승인', '사용자가 콘텐츠 승인', 4, TRUE, NOW(), NOW()),
('REJECTED', 'CONTENT_STATUS', '거부', '사용자가 콘텐츠 거부', 5, TRUE, NOW(), NOW()),
('PUBLISHED', 'CONTENT_STATUS', '발행완료', '블로그에 발행 완료', 6, TRUE, NOW(), NOW()),
('CONTENT_FAILED', 'CONTENT_STATUS', '실패', 'AI 콘텐츠 생성 실패', 7, TRUE, NOW(), NOW()),
-- POST_STATUS
('SCHEDULED', 'POST_STATUS', '예약', '발행 예약됨', 1, TRUE, NOW(), NOW()),
('PUBLISHING', 'POST_STATUS', '발행중', '블로그에 발행 중', 2, TRUE, NOW(), NOW()),
('POST_PUBLISHED', 'POST_STATUS', '발행완료', '블로그에 발행 완료', 3, TRUE, NOW(), NOW()),
('POST_FAILED', 'POST_STATUS', '실패', '발행 실패', 4, TRUE, NOW(), NOW()),
-- AUTH_PROVIDER
('LOCAL', 'AUTH_PROVIDER', '로컬', '이메일/비밀번호 로그인', 1, TRUE, NOW(), NOW()),
('KAKAO', 'AUTH_PROVIDER', '카카오', '카카오 계정 로그인', 2, TRUE, NOW(), NOW()),
('GOOGLE', 'AUTH_PROVIDER', '구글', '구글 계정 로그인', 3, TRUE, NOW(), NOW()),
('NAVER', 'AUTH_PROVIDER', '네이버', '네이버 계정 로그인', 4, TRUE, NOW(), NOW()),
-- USER_ROLE
('ADMIN', 'USER_ROLE', '관리자', '시스템 전체 관리 권한', 1, TRUE, NOW(), NOW()),
('USER', 'USER_ROLE', '사용자', '일반 사용자 권한', 2, TRUE, NOW(), NOW()),
('GUEST', 'USER_ROLE', '게스트', '제한된 권한', 3, TRUE, NOW(), NOW()),
-- USER_STATUS
('ACTIVE', 'USER_STATUS', '활성', '정상 활동 중인 사용자', 1, TRUE, NOW(), NOW()),
('INACTIVE', 'USER_STATUS', '비활성', '로그인하지 않은 상태', 2, TRUE, NOW(), NOW()),
('SUSPENDED', 'USER_STATUS', '정지', '관리자에 의해 정지됨', 3, TRUE, NOW(), NOW()),
('DORMANT', 'USER_STATUS', '휴면', '장기간 미접속으로 휴면 전환', 4, TRUE, NOW(), NOW()),
('WITHDRAWN', 'USER_STATUS', '탈퇴', '회원 탈퇴', 5, TRUE, NOW(), NOW()),
-- REPEAT_TYPE
('ONCE', 'REPEAT_TYPE', '한번만', '1회만 실행', 1, TRUE, NOW(), NOW()),
('DAILY', 'REPEAT_TYPE', '매일', '매일 반복 실행', 2, TRUE, NOW(), NOW()),
('WEEKLY', 'REPEAT_TYPE', '매주', '매주 반복 실행', 3, TRUE, NOW(), NOW()),
('MONTHLY', 'REPEAT_TYPE', '매월', '매월 반복 실행', 4, TRUE, NOW(), NOW()),
('CUSTOM', 'REPEAT_TYPE', '사용자정의', '사용자가 정의한 반복 규칙', 5, TRUE, NOW(), NOW()),
-- WORKFLOW_STATUS
('WORKFLOW_PENDING', 'WORKFLOW_STATUS', '대기', '워크플로우 생성 후 첫 실행 대기 중', 1, TRUE, NOW(), NOW()),
('WORKFLOW_ACTIVE', 'WORKFLOW_STATUS', '활성', '워크플로우가 활성화되어 자동 실행 중', 2, TRUE, NOW(), NOW()),
('WORKFLOW_INACTIVE', 'WORKFLOW_STATUS', '비활성', '워크플로우가 비활성화되어 실행 중지', 3, TRUE, NOW(), NOW()),
('WORKFLOW_COMPLETED', 'WORKFLOW_STATUS', '완료', '워크플로우 완전 종료', 4, TRUE, NOW(), NOW()),
-- LOG_LEVEL
('TRACE', 'LOG_LEVEL', '추적', '가장 상세한 추적 정보', 1, TRUE, NOW(), NOW()),
('DEBUG', 'LOG_LEVEL', '디버그', '디버깅용 상세 정보', 2, TRUE, NOW(), NOW()),
('INFO', 'LOG_LEVEL', '정보', '일반 정보성 메시지', 3, TRUE, NOW(), NOW()),
('WARN', 'LOG_LEVEL', '경고', '경고 메시지', 4, TRUE, NOW(), NOW()),
('ERROR', 'LOG_LEVEL', '오류', '오류 메시지', 5, TRUE, NOW(), NOW()),
('FATAL', 'LOG_LEVEL', '치명적', '치명적인 오류', 6, TRUE, NOW(), NOW()),
-- STEP_STATUS
('SUCCESS', 'STEP_STATUS', '성공', '단계 실행 성공', 1, TRUE, NOW(), NOW()),
('STEP_FAILED', 'STEP_STATUS', '실패', '단계 실행 실패', 2, TRUE, NOW(), NOW()),
('SKIPPED', 'STEP_STATUS', '건너뜀', '단계 건너뜀', 3, TRUE, NOW(), NOW()),
('RETRY', 'STEP_STATUS', '재시도', '재시도 중', 4, TRUE, NOW(), NOW()),
-- SITE_URL_INFO
('MUSINSA', 'SITE_URL_INFO', '무신사', 'https://www.musinsa.com', 1, TRUE, NOW(), NOW()),
('GMARKET', 'SITE_URL_INFO', 'G마켓', 'https://www.gmarket.co.kr', 2, TRUE, NOW(), NOW()),
('TWENTY_NINE_CM', 'SITE_URL_INFO', '29CM', 'https://www.29cm.co.kr', 3, TRUE, NOW(), NOW()),
('OLIVEYOUNG', 'SITE_URL_INFO', '올리브영', 'https://www.oliveyoung.co.kr', 4, TRUE, NOW(), NOW()),
('ELEVEN_ST', 'SITE_URL_INFO', '11번가', 'https://www.11st.co.kr', 5, TRUE, NOW(), NOW()),
('SSG', 'SITE_URL_INFO', 'SSG', 'https://www.ssg.com', 6, TRUE, NOW(), NOW()),
('EQL', 'SITE_URL_INFO', 'EQL', 'https://www.eql.kr', 7, TRUE, NOW(), NOW()),
('KREAM', 'SITE_URL_INFO', '크림', 'https://kream.co.kr', 8, TRUE, NOW(), NOW()),
('ZIGZAG', 'SITE_URL_INFO', '지그재그', 'https://www.zigzag.kr', 9, TRUE, NOW(), NOW()),
('SSADAGU', 'SITE_URL_INFO', '싸다구', 'https://www.sadagu.kr', 10, TRUE, NOW(), NOW());

-- ============================================
-- 18. 시스템 로그 (system_logs)
-- ============================================
INSERT INTO `system_logs` (`log_id`, `log_level`, `message`, `error_type`, `task_type`, `ip_address`, `stack_trace`,
                           `request_data`, `created_at`, `updated_at`)
VALUES (1, 'INFO', '워크플로우 1 시작', NULL, 'WORKFLOW_START', '127.0.0.1', NULL, '{"workflow_id": 1}', NOW(), NOW()),
       (2, 'ERROR', '크롤링 실패', 'NETWORK_ERROR', 'HTML_CRAWL', '127.0.0.1', 'java.net.ConnectException...',
        '{"url": "https://example.com"}', NOW(), NOW()),
       (3, 'INFO', '워크플로우 2 시작', NULL, 'WORKFLOW_START', '127.0.0.2', NULL, '{"workflow_id": 2}', NOW(), NOW());

-- ============================================
-- 19. 일별 통계 (daily_statistics)
-- ============================================
INSERT INTO `daily_statistics` (`stat_id`, `workflow_id`, `stat_date`, `total_users`, `user_growth_rate`, `total_posts`,
                                `successful_posts`, `post_growth_rate`, `ai_requests`, `ai_cost`, `ai_growth_rate`,
                                `today_value`, `today_growth_rate`, `created_at`, `updated_at`)
VALUES (1, 1, CURDATE(), 1, 0.00, 1, 1, 0.00, 1, 0.01, 0.00, 1, 0.00, NOW(), NOW()),
       (2, 2, CURDATE(), 1, 0.00, 1, 1, 0.00, 1, 0.02, 0.00, 1, 0.00, NOW(), NOW());

-- ============================================
-- 20. 시스템 일별 통계 (system_daily_statistics)
-- ============================================
-- 데이터 설명:
-- - 365일간의 일별 통계 데이터 (년/월/일 단위 프론트엔드 테스트용)
-- - 날짜 범위: 2024-12-15 ~ 2025-12-14
-- - 성장 패턴: 초기 급성장 → 성장기 → 성숙기
-- - 주말/평일 패턴 포함, 현실적인 사용자 행동 반영
--
-- 생성 정보:
-- - 총 레코드 수: 365개
-- - 시작: 14명 사용자, $10.94 AI 비용
-- - 종료: 976명 사용자, $1235.17 AI 비용
--
DELETE FROM `system_daily_statistics`;
SET @stat_id := 0;
INSERT INTO `system_daily_statistics`
(`stat_id`, `stat_date`, `total_users`, `user_growth_rate`, `total_workflows`, `workflow_growth_rate`,
 `post_growth_rate`, `total_ai_requests`, `total_ai_cost`, `ai_cost_growth_rate`,
 `active_users_today`, `active_user_growth_rate`, `created_at`, `updated_at`)
VALUES
(@stat_id := @stat_id + 1, '2024-12-15', 14, 0.00, 25, 0, 0.00, 600, 10.94, 0.00, 3, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-16', 18, 28.57, 27, 8, 8.11, 726, 13.43, 22.77, 6, 100.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-17', 22, 22.22, 33, 22, 14.10, 876, 16.43, 22.39, 8, 33.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-18', 23, 4.55, 45, 36, 14.68, 934, 17.81, 8.37, 8, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-19', 27, 17.39, 42, -6, 15.57, 1114, 21.95, 23.25, 10, 25.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-20', 28, 3.70, 53, 26, 12.64, 1164, 23.05, 5.01, 10, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-21', 31, 10.71, 61, 15, 16.91, 1314, 25.35, 9.96, 6, -40.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-22', 32, 3.23, 63, 3, 7.39, 1366, 26.39, 4.09, 9, 50.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-23', 33, 3.13, 49, -22, 12.14, 1416, 27.63, 4.73, 13, 44.44, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-24', 36, 9.09, 68, 38, 18.32, 1536, 29.55, 6.95, 12, -7.69, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-25', 38, 5.56, 69, 1, 15.08, 1596, 30.67, 3.77, 14, 16.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-26', 39, 2.63, 74, 7, 15.94, 1646, 31.84, 3.82, 15, 7.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-27', 41, 5.13, 79, 6, 7.71, 1754, 33.73, 5.94, 14, -6.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-28', 42, 2.44, 63, -20, 19.20, 1804, 34.64, 2.69, 11, -21.43, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-29', 43, 2.38, 69, 9, 9.84, 1854, 35.66, 2.96, 9, -18.18, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-30', 45, 4.65, 85, 23, 9.30, 1954, 37.69, 5.68, 16, 77.78, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2024-12-31', 47, 4.44, 76, -10, 5.95, 2026, 39.13, 3.82, 17, 6.25, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-01', 49, 4.26, 86, 13, 19.45, 2146, 41.70, 6.58, 18, 5.88, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-02', 52, 6.12, 89, 3, 13.01, 2261, 43.86, 5.17, 19, 5.56, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-03', 53, 1.92, 90, 1, 17.51, 2311, 44.69, 1.89, 18, -5.26, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-04', 56, 5.66, 106, 17, 11.01, 2401, 46.39, 3.81, 15, -16.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-05', 60, 7.14, 105, 0, 13.24, 2492, 48.17, 3.83, 13, -13.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-06', 61, 1.67, 92, -12, 15.69, 2550, 49.10, 1.94, 24, 84.62, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-07', 63, 3.28, 117, 27, 9.57, 2658, 51.09, 4.04, 24, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-08', 65, 3.17, 106, -9, 10.09, 2730, 52.87, 3.50, 24, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-09', 66, 1.54, 99, -6, 6.95, 2780, 54.06, 2.24, 24, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-10', 70, 6.06, 120, 21, 8.99, 2899, 56.37, 4.28, 27, 12.50, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-11', 72, 2.86, 126, 5, 14.01, 2971, 57.60, 2.18, 17, -37.04, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-12', 73, 1.39, 117, -7, 9.79, 3021, 58.65, 1.83, 14, -17.65, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-13', 74, 1.37, 138, 17, 16.01, 3071, 59.52, 1.48, 29, 107.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-14', 76, 2.70, 151, 9, 14.52, 3127, 60.58, 1.78, 27, -6.90, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-15', 78, 2.63, 124, -17, 11.74, 3177, 61.36, 1.29, 28, 3.70, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-16', 80, 2.56, 147, 18, 15.52, 3293, 63.32, 3.20, 31, 10.71, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-17', 84, 5.00, 166, 12, 6.25, 3461, 66.50, 5.03, 29, -6.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-18', 86, 2.38, 144, -13, 18.68, 3577, 68.80, 3.46, 24, -17.24, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-19', 87, 1.16, 164, 13, 16.38, 3627, 69.97, 1.70, 24, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-20', 89, 2.30, 173, 5, 8.06, 3677, 70.90, 1.33, 32, 33.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-21', 91, 2.25, 164, -5, 17.21, 3749, 72.53, 2.29, 35, 9.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-22', 93, 2.20, 183, 11, 11.99, 3849, 74.71, 3.01, 33, -5.71, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-23', 97, 4.30, 192, 4, 12.87, 3945, 76.22, 2.01, 36, 9.09, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-24', 98, 1.03, 169, -11, 8.80, 3995, 77.01, 1.04, 36, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-25', 101, 3.06, 157, -7, 18.47, 4085, 79.19, 2.84, 27, -25.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-26', 103, 1.98, 182, 15, 9.81, 4145, 80.11, 1.16, 21, -22.22, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-27', 106, 2.91, 183, 0, 8.50, 4295, 83.01, 3.62, 39, 85.71, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-28', 107, 0.94, 167, -8, 8.59, 4345, 83.86, 1.03, 39, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-29', 111, 3.74, 202, 20, 5.91, 4492, 86.70, 3.38, 42, 7.69, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-30', 115, 3.60, 183, -9, 18.89, 4583, 88.28, 1.82, 41, -2.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-01-31', 118, 2.61, 190, 3, 13.26, 4663, 89.50, 1.39, 46, 12.20, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-01', 122, 3.39, 190, 0, 10.66, 4741, 91.10, 1.79, 27, -41.30, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-02', 125, 2.46, 241, 26, 16.52, 4909, 93.97, 3.15, 35, 29.63, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-03', 129, 3.20, 253, 4, 5.89, 5109, 98.51, 4.83, 46, 31.43, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-04', 130, 0.78, 222, -12, 12.26, 5159, 99.27, 0.77, 49, 6.52, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-05', 134, 3.08, 253, 13, 11.07, 5278, 102.15, 2.89, 48, -2.04, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-06', 138, 2.99, 224, -11, 9.89, 5383, 104.33, 2.14, 52, 8.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-07', 142, 2.90, 268, 19, 10.74, 5544, 108.28, 3.79, 50, -3.85, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-08', 144, 1.41, 227, -15, 16.46, 5648, 110.41, 1.96, 38, -24.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-09', 146, 1.39, 269, 18, 5.35, 5714, 111.74, 1.20, 33, -13.16, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-10', 147, 0.68, 247, -8, 8.97, 5772, 113.08, 1.20, 52, 57.58, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-11', 151, 2.72, 259, 4, 10.36, 5863, 115.21, 1.89, 53, 1.92, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-12', 153, 1.32, 269, 3, 19.08, 5967, 117.62, 2.10, 58, 9.43, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-13', 154, 0.65, 262, -2, 14.22, 6021, 118.89, 1.08, 58, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-14', 158, 2.60, 259, -1, 14.65, 6123, 120.92, 1.71, 60, 3.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-15', 159, 0.63, 243, -6, 17.18, 6173, 122.15, 1.01, 33, -45.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-16', 161, 1.26, 249, 2, 13.29, 6223, 123.25, 0.90, 41, 24.24, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-17', 163, 1.24, 315, 26, 14.06, 6273, 124.25, 0.81, 58, 41.46, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-18', 167, 2.45, 314, 0, 9.78, 6449, 128.19, 3.17, 58, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-19', 168, 0.60, 296, -5, 14.32, 6499, 129.40, 0.95, 65, 12.07, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-20', 171, 1.79, 283, -4, 19.68, 6607, 131.81, 1.86, 66, 1.54, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-21', 175, 2.34, 306, 8, 9.81, 6677, 132.92, 0.85, 68, 3.03, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-22', 177, 1.14, 315, 2, 17.76, 6740, 133.88, 0.72, 50, -26.47, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-23', 178, 0.56, 287, -8, 7.63, 6790, 134.64, 0.56, 46, -8.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-24', 182, 2.25, 319, 11, 16.94, 6965, 138.04, 2.53, 72, 56.52, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-25', 186, 2.20, 357, 11, 16.80, 7197, 141.83, 2.75, 72, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-26', 190, 2.15, 351, -1, 18.16, 7330, 144.32, 1.75, 73, 1.39, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-27', 191, 0.53, 330, -5, 7.79, 7380, 145.39, 0.75, 75, 2.74, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-02-28', 192, 0.52, 364, 10, 18.60, 7430, 146.62, 0.84, 75, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-01', 195, 1.56, 378, 3, 14.31, 7526, 148.45, 1.25, 45, -40.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-02', 196, 0.51, 305, -19, 16.27, 7576, 149.60, 0.78, 58, 28.89, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-03', 200, 2.04, 376, 23, 7.96, 7800, 153.81, 2.81, 79, 36.21, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-04', 203, 1.50, 313, -16, 13.44, 7855, 155.08, 0.83, 75, -5.06, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-05', 205, 0.99, 368, 17, 16.56, 7915, 156.23, 0.74, 76, 1.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-06', 207, 0.98, 394, 7, 14.72, 7979, 157.31, 0.69, 77, 1.32, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-07', 209, 0.97, 366, -7, 15.57, 8069, 159.39, 1.32, 74, -3.90, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-08', 213, 1.91, 412, 12, 8.79, 8229, 162.61, 2.02, 50, -32.43, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-09', 217, 1.88, 397, -3, 16.67, 8362, 165.44, 1.74, 48, -4.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-10', 219, 0.92, 377, -5, 18.33, 8438, 167.11, 1.01, 80, 66.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-11', 220, 0.46, 340, -9, 18.57, 8488, 167.98, 0.52, 79, -1.25, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-12', 224, 1.82, 406, 19, 17.08, 8648, 170.57, 1.54, 80, 1.27, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-13', 227, 1.34, 408, 0, 5.43, 8773, 172.85, 1.34, 79, -1.25, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-14', 228, 0.44, 408, 0, 8.77, 8823, 174.03, 0.68, 80, 1.27, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-15', 231, 1.32, 475, 16, 6.86, 9033, 178.73, 2.70, 68, -15.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-16', 236, 2.16, 465, -2, 7.54, 9423, 185.40, 3.73, 47, -30.88, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-17', 240, 1.69, 545, 17, 4.02, 9648, 189.72, 2.33, 84, 78.72, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-18', 243, 1.25, 532, -2, 9.90, 9788, 192.29, 1.36, 90, 7.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-19', 247, 1.65, 524, -1, 5.41, 10085, 199.33, 3.66, 93, 3.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-20', 252, 2.02, 470, -10, 2.91, 10364, 204.82, 2.75, 91, -2.15, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-21', 256, 1.59, 537, 14, 8.91, 10688, 212.59, 3.80, 102, 12.09, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-22', 261, 1.95, 580, 8, 2.27, 11073, 220.82, 3.87, 56, -45.10, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-23', 266, 1.92, 596, 2, 5.77, 11293, 226.21, 2.44, 72, 28.57, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-24', 268, 0.75, 594, 0, 7.88, 11403, 228.29, 0.92, 106, 47.22, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-25', 271, 1.12, 622, 4, 8.11, 11571, 232.28, 1.75, 107, 0.94, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-26', 274, 1.11, 525, -15, 8.58, 11775, 236.12, 1.65, 104, -2.80, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-27', 278, 1.46, 587, 11, 6.62, 12000, 240.15, 1.71, 102, -1.92, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-28', 283, 1.80, 636, 8, 2.02, 12374, 248.45, 3.45, 102, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-29', 285, 0.71, 615, -3, 4.10, 12494, 250.32, 0.75, 62, -39.22, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-30', 287, 0.70, 620, 0, 8.39, 12630, 252.64, 0.93, 60, -3.23, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-03-31', 290, 1.05, 558, -10, 3.54, 12852, 256.81, 1.65, 106, 76.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-01', 295, 1.72, 540, -3, 3.64, 13232, 262.75, 2.31, 104, -1.89, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-02', 298, 1.02, 609, 12, 7.85, 13448, 267.57, 1.84, 109, 4.81, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-03', 300, 0.67, 566, -7, 9.34, 13540, 269.83, 0.84, 117, 7.34, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-04', 305, 1.67, 639, 12, 6.12, 13947, 277.83, 2.96, 110, -5.98, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-05', 308, 0.98, 701, 9, 7.01, 14220, 283.81, 2.15, 66, -40.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-06', 310, 0.65, 594, -15, 8.11, 14352, 286.76, 1.04, 72, 9.09, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-07', 313, 0.97, 655, 10, 3.60, 14526, 290.50, 1.30, 114, 58.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-08', 316, 0.96, 589, -10, 3.69, 14676, 293.58, 1.06, 115, 0.88, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-09', 321, 1.58, 594, 0, 4.58, 14856, 297.89, 1.47, 116, 0.87, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-10', 323, 0.62, 616, 3, 9.16, 14968, 300.12, 0.75, 124, 6.90, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-11', 325, 0.62, 659, 6, 5.32, 15080, 302.51, 0.80, 113, -8.87, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-12', 327, 0.62, 591, -10, 7.29, 15194, 305.33, 0.93, 83, -26.55, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-13', 332, 1.53, 723, 22, 3.90, 15524, 311.67, 2.08, 95, 14.46, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-14', 336, 1.20, 650, -10, 7.69, 15836, 316.41, 1.52, 121, 27.37, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-15', 338, 0.60, 668, 2, 8.49, 15988, 319.10, 0.85, 118, -2.48, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-16', 341, 0.89, 736, 10, 7.60, 16177, 322.82, 1.16, 126, 6.78, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-17', 346, 1.47, 729, 0, 2.61, 16437, 329.22, 1.98, 135, 7.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-18', 349, 0.87, 674, -7, 8.54, 16671, 333.31, 1.24, 131, -2.96, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-19', 354, 1.43, 688, 2, 2.03, 16921, 338.28, 1.49, 89, -32.06, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-20', 356, 0.56, 705, 2, 4.30, 17005, 340.17, 0.56, 104, 16.85, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-21', 359, 0.84, 670, -4, 7.53, 17209, 344.29, 1.21, 136, 30.77, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-22', 361, 0.56, 732, 9, 3.47, 17317, 346.62, 0.68, 132, -2.94, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-23', 366, 1.39, 767, 4, 9.37, 17567, 351.54, 1.42, 144, 9.09, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-24', 368, 0.55, 710, -7, 8.39, 17715, 354.59, 0.87, 143, -0.69, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-25', 371, 0.82, 743, 4, 3.18, 17883, 358.08, 0.98, 140, -2.10, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-26', 373, 0.54, 747, 0, 7.61, 17971, 360.11, 0.57, 76, -45.71, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-27', 375, 0.54, 819, 9, 5.97, 18146, 364.01, 1.08, 77, 1.32, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-28', 379, 1.07, 709, -13, 9.76, 18300, 367.75, 1.03, 138, 79.22, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-29', 384, 1.32, 757, 6, 4.01, 18660, 374.64, 1.87, 140, 1.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-04-30', 389, 1.30, 735, -2, 9.56, 18984, 379.73, 1.36, 136, -2.86, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-01', 394, 1.29, 877, 19, 4.31, 19215, 383.23, 0.92, 138, 1.47, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-02', 399, 1.27, 915, 4, 9.10, 19633, 391.26, 2.09, 152, 10.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-03', 403, 1.00, 893, -2, 3.01, 19885, 395.73, 1.14, 96, -36.84, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-04', 405, 0.50, 803, -10, 4.01, 19977, 397.23, 0.38, 113, 17.71, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-05', 410, 1.23, 745, -7, 7.71, 20202, 401.07, 0.97, 155, 37.17, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-06', 415, 1.22, 826, 10, 2.90, 20582, 407.04, 1.49, 145, -6.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-07', 417, 0.48, 931, 12, 7.71, 20782, 410.41, 0.83, 150, 3.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-08', 422, 1.20, 811, -12, 4.73, 21172, 419.79, 2.28, 154, 2.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-09', 425, 0.71, 972, 19, 4.59, 21403, 424.41, 1.10, 169, 9.74, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-10', 427, 0.47, 856, -11, 7.58, 21535, 427.54, 0.74, 112, -33.73, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-11', 432, 1.17, 911, 6, 6.96, 21795, 433.77, 1.46, 93, -16.96, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-12', 434, 0.46, 988, 8, 6.69, 21905, 435.96, 0.50, 152, 63.44, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-13', 438, 0.92, 987, 0, 4.47, 22130, 441.35, 1.24, 156, 2.63, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-14', 441, 0.68, 797, -19, 9.53, 22235, 443.13, 0.40, 156, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-15', 446, 1.13, 863, 8, 8.96, 22559, 449.57, 1.45, 161, 3.21, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-16', 448, 0.45, 908, 5, 2.06, 22707, 452.58, 0.67, 175, 8.70, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-17', 450, 0.45, 973, 7, 8.09, 22787, 454.09, 0.33, 123, -29.71, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-18', 454, 0.89, 850, -12, 9.47, 23046, 459.97, 1.29, 129, 4.88, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-19', 458, 0.88, 980, 15, 7.42, 23358, 467.16, 1.56, 164, 27.13, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-20', 461, 0.66, 1051, 7, 4.72, 23512, 469.85, 0.58, 163, -0.61, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-21', 464, 0.65, 915, -12, 9.84, 23734, 474.68, 1.03, 177, 8.59, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-22', 467, 0.65, 845, -7, 9.91, 23909, 477.38, 0.57, 167, -5.65, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-23', 470, 0.64, 1011, 19, 5.65, 24119, 481.42, 0.85, 176, 5.39, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-24', 472, 0.43, 867, -14, 7.25, 24233, 484.23, 0.58, 112, -36.36, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-25', 475, 0.64, 879, 1, 8.93, 24425, 488.51, 0.88, 95, -15.18, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-26', 479, 0.84, 945, 7, 2.82, 24593, 492.11, 0.74, 175, 84.21, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-27', 483, 0.84, 917, -2, 7.34, 24825, 495.98, 0.79, 171, -2.29, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-28', 487, 0.83, 993, 8, 3.50, 25137, 503.27, 1.47, 182, 6.43, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-29', 492, 1.03, 902, -9, 5.13, 25398, 509.27, 1.19, 182, 0.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-30', 495, 0.61, 1134, 25, 7.98, 25614, 513.13, 0.76, 191, 4.95, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-05-31', 497, 0.40, 948, -16, 5.73, 25734, 515.43, 0.45, 130, -31.94, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-01', 501, 0.80, 939, 0, 3.31, 25990, 519.77, 0.84, 122, -6.15, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-02', 503, 0.40, 965, 2, 8.41, 26070, 521.34, 0.30, 181, 48.36, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-03', 506, 0.60, 1051, 8, 4.88, 26220, 523.97, 0.51, 185, 2.21, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-04', 508, 0.40, 1123, 6, 7.92, 26308, 525.73, 0.34, 183, -1.08, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-05', 512, 0.79, 956, -14, 7.79, 26581, 530.62, 0.93, 187, 2.19, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-06', 517, 0.98, 1055, 10, 4.08, 26901, 535.85, 0.99, 206, 10.16, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-07', 522, 0.97, 1039, -1, 6.69, 27231, 541.68, 1.09, 106, -48.54, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-08', 526, 0.77, 1068, 2, 7.65, 27423, 546.03, 0.80, 144, 35.85, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-09', 530, 0.76, 1210, 13, 7.36, 27666, 551.30, 0.97, 186, 29.17, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-10', 535, 0.94, 1123, -7, 8.53, 28066, 558.53, 1.31, 202, 8.60, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-11', 539, 0.75, 1224, 8, 5.53, 28399, 566.48, 1.42, 191, -5.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-12', 543, 0.74, 1176, -3, 4.30, 28597, 571.21, 0.84, 192, 0.52, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-13', 546, 0.55, 1201, 2, 4.83, 28814, 574.69, 0.61, 200, 4.17, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-14', 549, 0.55, 1175, -2, 6.25, 29018, 579.58, 0.85, 158, -21.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-15', 554, 0.91, 1257, 6, 4.38, 29370, 587.45, 1.36, 153, -3.16, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-16', 557, 0.54, 1212, -3, 8.67, 29562, 591.65, 0.72, 211, 37.91, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-17', 561, 0.72, 1211, 0, 9.48, 29886, 597.80, 1.04, 221, 4.74, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-18', 563, 0.36, 1267, 4, 7.84, 29974, 599.26, 0.24, 206, -6.79, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-19', 566, 0.53, 1145, -9, 8.74, 30124, 602.35, 0.52, 216, 4.85, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-20', 571, 0.88, 1181, 3, 7.28, 30454, 609.84, 1.24, 203, -6.02, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-21', 575, 0.70, 1258, 6, 8.91, 30787, 615.08, 0.86, 135, -33.50, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-22', 578, 0.52, 1232, -2, 4.14, 30961, 618.62, 0.57, 123, -8.89, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-23', 581, 0.52, 1134, -7, 3.65, 31105, 621.65, 0.49, 224, 82.11, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-24', 585, 0.69, 1175, 3, 7.04, 31281, 625.91, 0.69, 222, -0.89, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-25', 590, 0.85, 1256, 6, 2.30, 31481, 629.70, 0.61, 225, 1.35, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-26', 593, 0.51, 1109, -11, 8.06, 31709, 635.37, 0.90, 218, -3.11, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-27', 598, 0.84, 1172, 5, 7.35, 32049, 642.15, 1.07, 212, -2.75, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-28', 601, 0.50, 1314, 12, 5.03, 32189, 645.22, 0.48, 157, -25.94, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-29', 606, 0.83, 1119, -14, 6.07, 32441, 649.15, 0.61, 132, -15.92, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-06-30', 609, 0.50, 1238, 10, 3.12, 32581, 651.88, 0.42, 234, 77.27, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-01', 612, 0.49, 1143, -7, 5.74, 32725, 655.11, 0.50, 220, -5.98, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-02', 617, 0.82, 1415, 23, 4.31, 32989, 661.43, 0.96, 236, 7.27, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-03', 620, 0.49, 1331, -5, 7.86, 33133, 664.96, 0.53, 243, 2.97, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-04', 624, 0.65, 1271, -4, 6.85, 33413, 671.22, 0.94, 246, 1.23, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-05', 626, 0.32, 1221, -3, 5.98, 33561, 673.81, 0.39, 133, -45.93, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-06', 628, 0.32, 1307, 7, 8.41, 33649, 675.77, 0.29, 159, 19.55, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-07', 632, 0.64, 1372, 4, 2.56, 33946, 682.19, 0.95, 251, 57.86, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-08', 634, 0.32, 1368, 0, 2.64, 34081, 685.20, 0.44, 240, -4.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-09', 636, 0.32, 1408, 2, 4.95, 34165, 686.73, 0.22, 231, -3.75, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-10', 641, 0.79, 1317, -6, 8.68, 34495, 694.01, 1.06, 242, 4.76, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-11', 643, 0.31, 1304, 0, 6.87, 34639, 697.11, 0.45, 256, 5.79, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-12', 646, 0.47, 1248, -4, 4.86, 34825, 700.90, 0.54, 173, -32.42, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-13', 649, 0.46, 1349, 8, 4.19, 35071, 705.77, 0.70, 147, -15.03, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-14', 652, 0.46, 1535, 13, 5.00, 35399, 712.18, 0.91, 260, 76.87, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-15', 655, 0.46, 1423, -7, 2.20, 35597, 715.82, 0.51, 246, -5.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-16', 658, 0.46, 1407, -1, 4.06, 35891, 722.86, 0.98, 235, -4.47, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-17', 661, 0.46, 1571, 11, 3.86, 36107, 728.05, 0.72, 251, 6.81, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-18', 664, 0.45, 1478, -5, 4.45, 36401, 733.05, 0.69, 237, -5.58, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-19', 666, 0.30, 1580, 6, 3.25, 36566, 735.88, 0.39, 147, -37.97, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-20', 669, 0.45, 1360, -13, 3.06, 36916, 741.24, 0.73, 153, 4.08, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-21', 671, 0.30, 1634, 20, 4.61, 37071, 744.70, 0.47, 264, 72.55, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-22', 674, 0.45, 1532, -6, 2.01, 37365, 749.33, 0.62, 263, -0.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-23', 677, 0.45, 1486, -3, 2.07, 37527, 753.24, 0.52, 249, -5.32, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-24', 679, 0.30, 1524, 2, 4.94, 37715, 757.74, 0.60, 261, 4.82, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-25', 680, 0.15, 1589, 4, 3.23, 37781, 758.76, 0.13, 266, 1.92, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-26', 682, 0.29, 1539, -3, 4.26, 37961, 762.38, 0.48, 165, -37.97, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-27', 683, 0.15, 1417, -7, 1.27, 38043, 763.78, 0.18, 164, -0.61, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-28', 685, 0.29, 1441, 1, 3.26, 38193, 767.52, 0.49, 262, 59.76, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-29', 687, 0.29, 1585, 9, 2.58, 38373, 771.86, 0.56, 271, 3.44, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-30', 688, 0.15, 1588, 0, 2.92, 38454, 773.15, 0.17, 268, -1.11, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-07-31', 689, 0.15, 1644, 3, 4.67, 38571, 776.00, 0.37, 274, 2.24, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-01', 691, 0.29, 1478, -10, 1.89, 38711, 778.23, 0.29, 268, -2.19, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-02', 694, 0.43, 1557, 5, 4.98, 38867, 781.18, 0.38, 144, -46.27, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-03', 696, 0.29, 1612, 3, 2.27, 39032, 785.12, 0.50, 201, 39.58, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-04', 698, 0.29, 1642, 1, 3.25, 39277, 789.21, 0.52, 277, 37.81, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-05', 701, 0.43, 1547, -5, 1.05, 39627, 795.41, 0.79, 247, -10.83, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-06', 703, 0.29, 1631, 5, 3.15, 39767, 798.18, 0.35, 265, 7.29, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-07', 706, 0.43, 1486, -8, 1.30, 39989, 803.55, 0.67, 281, 6.04, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-08', 707, 0.14, 1665, 12, 4.98, 40067, 805.48, 0.24, 249, -11.39, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-09', 710, 0.42, 1621, -2, 3.06, 40263, 810.07, 0.57, 205, -17.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-10', 712, 0.28, 1578, -2, 2.26, 40463, 813.77, 0.46, 166, -19.02, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-11', 713, 0.14, 1585, 0, 2.59, 40523, 815.26, 0.18, 275, 65.66, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-12', 714, 0.14, 1516, -4, 1.95, 40628, 816.95, 0.21, 262, -4.73, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-13', 717, 0.42, 1489, -1, 2.95, 40796, 819.91, 0.36, 282, 7.63, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-14', 718, 0.14, 1605, 7, 2.39, 40876, 821.71, 0.22, 257, -8.87, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-15', 719, 0.14, 1524, -5, 3.36, 40975, 823.51, 0.22, 271, 5.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-16', 722, 0.42, 1503, -1, 2.23, 41155, 827.11, 0.44, 169, -37.64, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-17', 723, 0.14, 1625, 8, 3.78, 41241, 829.01, 0.23, 175, 3.55, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-18', 724, 0.14, 1594, -1, 2.31, 41311, 830.35, 0.16, 287, 64.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-19', 726, 0.28, 1470, -7, 3.41, 41467, 833.63, 0.40, 268, -6.62, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-20', 729, 0.41, 1666, 13, 4.81, 41649, 837.82, 0.50, 258, -3.73, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-21', 732, 0.41, 1598, -4, 1.95, 41873, 843.23, 0.65, 282, 9.30, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-22', 734, 0.27, 1721, 7, 3.91, 42008, 845.89, 0.32, 264, -6.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-23', 737, 0.41, 1687, -1, 4.85, 42266, 852.23, 0.75, 155, -41.29, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-24', 740, 0.41, 1590, -5, 4.27, 42416, 855.54, 0.39, 210, 35.48, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-25', 742, 0.27, 1542, -3, 1.17, 42600, 859.14, 0.42, 280, 33.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-26', 744, 0.27, 1513, -1, 1.22, 42792, 862.29, 0.37, 264, -5.71, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-27', 746, 0.27, 1814, 19, 2.63, 42922, 864.60, 0.27, 265, 0.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-28', 749, 0.40, 1749, -3, 4.16, 43272, 871.33, 0.78, 272, 2.64, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-29', 751, 0.27, 1694, -3, 1.05, 43402, 873.36, 0.23, 264, -2.94, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-30', 752, 0.13, 1839, 8, 2.90, 43552, 875.98, 0.30, 204, -22.73, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-08-31', 755, 0.40, 1601, -12, 1.69, 43786, 879.59, 0.41, 212, 3.92, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-01', 757, 0.26, 1866, 16, 4.27, 43916, 882.41, 0.32, 299, 41.04, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-02', 760, 0.40, 1884, 0, 4.68, 44244, 887.54, 0.58, 288, -3.68, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-03', 761, 0.13, 1799, -4, 4.08, 44334, 889.13, 0.18, 267, -7.29, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-04', 764, 0.39, 1645, -8, 4.62, 44516, 892.74, 0.41, 302, 13.11, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-05', 766, 0.26, 1671, 1, 1.21, 44676, 895.40, 0.30, 297, -1.66, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-06', 769, 0.39, 1561, -6, 4.23, 44880, 899.43, 0.45, 215, -27.61, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-07', 772, 0.39, 1660, 6, 4.61, 45126, 904.72, 0.59, 182, -15.35, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-08', 774, 0.26, 1912, 15, 4.83, 45366, 908.60, 0.43, 303, 66.48, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-09', 776, 0.26, 1926, 0, 1.06, 45576, 912.81, 0.46, 309, 1.98, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-10', 779, 0.39, 1913, 0, 3.44, 45772, 915.75, 0.32, 290, -6.15, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-11', 780, 0.13, 1727, -9, 2.32, 45830, 917.13, 0.15, 283, -2.41, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-12', 782, 0.26, 1691, -2, 4.31, 46010, 920.62, 0.38, 276, -2.47, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-13', 784, 0.26, 1931, 14, 1.97, 46160, 923.76, 0.34, 162, -41.30, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-14', 787, 0.38, 1795, -7, 3.50, 46475, 929.27, 0.60, 197, 21.60, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-15', 788, 0.13, 1684, -6, 2.28, 46531, 930.42, 0.12, 306, 55.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-16', 791, 0.38, 1748, 3, 3.09, 46783, 936.37, 0.64, 286, -6.54, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-17', 794, 0.38, 1795, 2, 2.53, 47028, 941.20, 0.52, 311, 8.74, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-18', 796, 0.25, 1706, -4, 4.76, 47220, 945.01, 0.40, 309, -0.64, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-19', 797, 0.13, 1919, 12, 2.06, 47310, 946.67, 0.18, 297, -3.88, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-20', 800, 0.38, 1742, -9, 2.39, 47590, 952.63, 0.63, 174, -41.41, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-21', 802, 0.25, 1876, 7, 2.81, 47702, 954.77, 0.22, 185, 6.32, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-22', 805, 0.37, 1902, 1, 2.78, 48031, 960.66, 0.62, 287, 55.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-23', 808, 0.37, 1866, -1, 1.03, 48283, 966.29, 0.59, 304, 5.92, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-24', 811, 0.37, 1921, 2, 4.61, 48549, 972.29, 0.62, 297, -2.30, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-25', 813, 0.25, 1758, -8, 2.52, 48699, 975.39, 0.32, 318, 7.07, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-26', 814, 0.12, 1955, 11, 3.38, 48787, 977.45, 0.21, 295, -7.23, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-27', 816, 0.25, 2000, 2, 4.98, 48932, 980.92, 0.36, 212, -28.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-28', 817, 0.12, 2030, 1, 2.15, 49058, 983.88, 0.30, 198, -6.60, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-29', 818, 0.12, 1843, -9, 4.92, 49158, 985.88, 0.20, 326, 64.65, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-09-30', 821, 0.37, 1791, -2, 4.54, 49356, 989.19, 0.34, 307, -5.83, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-01', 823, 0.24, 1931, 7, 4.22, 49496, 991.92, 0.28, 323, 5.21, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-02', 824, 0.12, 1660, -14, 3.22, 49556, 992.83, 0.09, 298, -7.74, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-03', 826, 0.24, 1815, 9, 4.91, 49664, 995.34, 0.25, 325, 9.06, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-04', 828, 0.24, 1924, 6, 3.47, 49856, 999.15, 0.38, 180, -44.62, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-05', 831, 0.36, 1879, -2, 2.10, 50136, 1005.47, 0.63, 247, 37.22, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-06', 833, 0.24, 1858, -1, 3.38, 50260, 1008.24, 0.28, 297, 20.24, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-07', 835, 0.24, 1878, 1, 4.00, 50452, 1012.67, 0.44, 318, 7.07, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-08', 837, 0.24, 1866, 0, 3.29, 50556, 1014.87, 0.22, 313, -1.57, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-09', 838, 0.12, 1950, 4, 3.59, 50642, 1016.36, 0.15, 330, 5.43, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-10', 841, 0.36, 1963, 0, 2.73, 50845, 1021.28, 0.48, 334, 1.21, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-11', 842, 0.12, 1693, -13, 2.26, 50927, 1022.89, 0.16, 170, -49.10, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-12', 845, 0.36, 1987, 17, 4.69, 51207, 1029.58, 0.65, 190, 11.76, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-13', 847, 0.24, 2073, 4, 2.95, 51417, 1033.83, 0.41, 330, 73.68, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-14', 850, 0.35, 1931, -6, 3.06, 51648, 1038.13, 0.42, 325, -1.52, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-15', 853, 0.35, 1903, -1, 1.82, 51948, 1042.98, 0.47, 299, -8.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-16', 855, 0.23, 2004, 5, 2.53, 52116, 1045.56, 0.25, 328, 9.70, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-17', 857, 0.23, 1943, -3, 2.33, 52361, 1049.53, 0.38, 305, -7.01, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-18', 860, 0.35, 1985, 2, 1.92, 52535, 1053.81, 0.41, 257, -15.74, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-19', 863, 0.35, 1988, 0, 4.38, 52850, 1059.33, 0.52, 224, -12.84, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-20', 865, 0.23, 1978, 0, 3.29, 53015, 1062.18, 0.27, 342, 52.68, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-21', 868, 0.35, 1846, -6, 2.70, 53273, 1067.13, 0.47, 329, -3.80, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-22', 869, 0.12, 1911, 3, 2.51, 53323, 1068.22, 0.10, 323, -1.82, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-23', 871, 0.23, 2057, 7, 4.42, 53443, 1071.19, 0.28, 315, -2.48, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-24', 873, 0.23, 1996, -2, 3.13, 53608, 1074.41, 0.30, 337, 6.98, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-25', 876, 0.34, 2063, 3, 3.68, 53825, 1077.75, 0.31, 222, -34.12, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-26', 877, 0.11, 1922, -6, 2.09, 53915, 1079.30, 0.14, 253, 13.96, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-27', 880, 0.34, 2069, 7, 3.25, 54237, 1085.39, 0.56, 325, 28.46, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-28', 883, 0.34, 1813, -12, 3.42, 54393, 1088.00, 0.24, 349, 7.38, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-29', 886, 0.34, 1881, 3, 3.30, 54687, 1094.74, 0.62, 353, 1.15, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-30', 889, 0.34, 2091, 11, 1.36, 54869, 1098.80, 0.37, 352, -0.28, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-10-31', 892, 0.34, 1972, -5, 3.15, 55170, 1105.07, 0.57, 316, -10.23, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-01', 893, 0.11, 1891, -4, 2.62, 55220, 1106.26, 0.11, 233, -26.27, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-02', 896, 0.34, 2077, 9, 3.67, 55430, 1110.79, 0.41, 180, -22.75, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-03', 899, 0.33, 1950, -6, 1.74, 55703, 1116.07, 0.48, 331, 83.89, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-04', 900, 0.11, 2133, 9, 2.79, 55781, 1117.74, 0.15, 341, 3.02, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-05', 903, 0.33, 2088, -2, 4.66, 55956, 1121.92, 0.37, 320, -6.16, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-06', 904, 0.11, 1886, -9, 4.37, 56026, 1123.17, 0.11, 330, 3.13, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-07', 906, 0.22, 1824, -3, 1.50, 56190, 1126.13, 0.26, 355, 7.58, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-08', 907, 0.11, 1886, 3, 2.97, 56244, 1127.28, 0.10, 229, -35.49, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-09', 910, 0.33, 2227, 18, 4.28, 56564, 1133.97, 0.59, 214, -6.55, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-10', 911, 0.11, 1948, -12, 3.90, 56662, 1135.53, 0.14, 361, 68.69, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-11', 914, 0.33, 2156, 10, 1.05, 56963, 1142.19, 0.59, 326, -9.70, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-12', 916, 0.22, 1915, -11, 2.83, 57193, 1146.69, 0.39, 336, 3.07, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-13', 917, 0.11, 1854, -3, 2.41, 57269, 1148.15, 0.13, 356, 5.95, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-14', 920, 0.33, 1879, 1, 4.21, 57449, 1151.49, 0.29, 339, -4.78, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-15', 923, 0.33, 2177, 15, 1.13, 57792, 1157.16, 0.49, 231, -31.86, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-16', 924, 0.11, 1882, -13, 2.07, 57844, 1157.96, 0.07, 233, 0.87, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-17', 925, 0.11, 2141, 13, 3.53, 57916, 1159.45, 0.13, 335, 43.78, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-18', 928, 0.32, 2261, 5, 1.41, 58164, 1164.14, 0.40, 344, 2.69, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-19', 931, 0.32, 1876, -17, 2.83, 58428, 1168.16, 0.34, 338, -1.74, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-20', 934, 0.32, 2002, 6, 2.20, 58645, 1171.81, 0.31, 359, 6.21, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-21', 937, 0.32, 2036, 1, 4.16, 58873, 1177.41, 0.48, 344, -4.18, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-22', 939, 0.21, 1934, -5, 2.29, 59045, 1180.32, 0.25, 258, -25.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-23', 940, 0.11, 1915, 0, 2.28, 59119, 1181.93, 0.14, 240, -6.98, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-24', 943, 0.32, 2313, 20, 3.12, 59375, 1186.43, 0.38, 372, 55.00, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-25', 945, 0.21, 2239, -3, 3.03, 59563, 1190.09, 0.31, 332, -10.75, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-26', 946, 0.11, 2268, 1, 1.02, 59645, 1191.42, 0.11, 343, 3.31, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-27', 948, 0.21, 2077, -8, 1.64, 59785, 1193.85, 0.20, 375, 9.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-28', 949, 0.11, 2078, 0, 4.59, 59869, 1195.46, 0.14, 350, -6.67, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-29', 952, 0.32, 1990, -4, 4.81, 60114, 1199.27, 0.32, 220, -37.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-11-30', 953, 0.11, 1960, -1, 3.79, 60186, 1200.46, 0.10, 232, 5.45, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-01', 955, 0.21, 2281, 16, 2.08, 60326, 1203.10, 0.22, 368, 58.62, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-02', 957, 0.21, 1991, -12, 1.47, 60438, 1204.93, 0.15, 379, 2.99, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-03', 960, 0.31, 2165, 8, 2.31, 60739, 1211.38, 0.54, 352, -7.12, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-04', 961, 0.10, 2062, -4, 2.19, 60835, 1213.61, 0.18, 336, -4.55, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-05', 962, 0.10, 2283, 10, 4.83, 60895, 1214.80, 0.10, 360, 7.14, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-06', 964, 0.21, 2112, -7, 3.34, 61020, 1217.06, 0.19, 202, -43.89, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-07', 965, 0.10, 2079, -1, 4.86, 61076, 1218.32, 0.10, 225, 11.39, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-08', 967, 0.21, 2127, 2, 3.83, 61281, 1221.69, 0.28, 363, 61.33, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-09', 969, 0.21, 2333, 9, 2.43, 61426, 1225.03, 0.27, 384, 5.79, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-10', 970, 0.10, 2303, -1, 4.00, 61525, 1226.59, 0.13, 358, -6.77, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-11', 973, 0.31, 2395, 3, 4.41, 61721, 1231.48, 0.40, 366, 2.23, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-12', 974, 0.10, 1953, -18, 4.55, 61795, 1232.92, 0.12, 348, -4.92, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-13', 975, 0.10, 1967, 0, 2.34, 61847, 1233.88, 0.08, 277, -20.40, NOW(), NOW()),
(@stat_id := @stat_id + 1, '2025-12-14', 976, 0.10, 2244, 14, 3.02, 61917, 1235.17, 0.11, 217, -21.66, NOW(), NOW());
