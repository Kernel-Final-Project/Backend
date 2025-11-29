package com.ocp.ocp_finalproject.common.config.init;

import org.springframework.core.io.Resource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@Slf4j
@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
@RequiredArgsConstructor
public class DummyDataInitializer implements ApplicationRunner {

    private final DataSource dataSource;

    @Value("classpath:db/seed/dummy_data.sql")
    private Resource dummyDataSql;

    @Override
    public void run(ApplicationArguments args) {
        log.info("========================================");
        log.info("[Init] DummyDataInitializer start");
        log.info("========================================");

        try {
            ResourceDatabasePopulator populator = new ResourceDatabasePopulator(dummyDataSql);
            populator.setSeparator(";");
            populator.setContinueOnError(true);  // 에러가 있어도 계속 진행
            populator.execute(dataSource);

            log.info("[Init] SQL 실행 완료");

            // 데이터 확인
            try (Connection c = dataSource.getConnection();
                 Statement st = c.createStatement()) {

                ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM user");
                if (rs1.next()) {
                    log.info("[Init] user 개수: {}", rs1.getInt(1));
                }

                ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM workflow");
                if (rs2.next()) {
                    log.info("[Init] workflow 개수: {}", rs2.getInt(1));
                }

                ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM recurrence_rule");
                if (rs3.next()) {
                    log.info("[Init] recurrence_rule 개수: {}", rs3.getInt(1));
                }

                ResultSet rs4 = st.executeQuery("SELECT COUNT(*) FROM work");
                if (rs4.next()) {
                    log.info("[Init] work 개수: {}", rs4.getInt(1));
                }


                ResultSet rs6 = st.executeQuery("SELECT COUNT(*) FROM product_crawl");
                if (rs6.next()) {
                    log.info("[Init] product_crawl 개수: {}", rs6.getInt(1));
                }

                ResultSet rs7 = st.executeQuery("SELECT COUNT(*) FROM work_detail_log");
                if (rs7.next()) {
                    log.info("[Init] work_detail_log 개수: {}", rs7.getInt(1));
                }

                ResultSet rs8 = st.executeQuery("SELECT COUNT(*) FROM ai_content");
                if (rs8.next()) {
                    log.info("[Init] ai_content 개수: {}", rs8.getInt(1));
                }

                ResultSet rs10 = st.executeQuery("SELECT COUNT(*) FROM ai_usage_log");
                if (rs10.next()) {
                    log.info("[Init] ai_usage_log 개수: {}", rs10.getInt(1));
                }

                ResultSet rs11 = st.executeQuery("SELECT COUNT(*) FROM notice");
                if (rs11.next()) {
                    log.info("[Init] notice 개수: {}", rs11.getInt(1));
                }

                ResultSet rs12 = st.executeQuery("SELECT COUNT(*) FROM auth");
                if (rs12.next()) {
                    log.info("[Init] auth 개수: {}", rs12.getInt(1));
                }

                ResultSet rs13 = st.executeQuery("SELECT COUNT(*) FROM user_blog");
                if (rs13.next()) {
                    log.info("[Init] user_blog 개수: {}", rs13.getInt(1));
                }

                ResultSet rs14 = st.executeQuery("SELECT COUNT(*) FROM blog_type");
                if (rs14.next()) {
                    log.info("[Init] blog_type 개수: {}", rs14.getInt(1));
                }

                ResultSet rs16 = st.executeQuery("SELECT COUNT(*) FROM trend_category");
                if (rs16.next()) {
                    log.info("[Init] trend_category 개수: {}", rs16.getInt(1));
                }

                ResultSet rs18 = st.executeQuery("SELECT COUNT(*) FROM common_code_group");
                if (rs18.next()) {
                    log.info("[Init] common_code_group 개수: {}", rs18.getInt(1));
                }

                ResultSet rs19 = st.executeQuery("SELECT COUNT(*) FROM common_code");
                if (rs19.next()) {
                    log.info("[Init] common_code 개수: {}", rs19.getInt(1));
                }

                ResultSet rs20 = st.executeQuery("SELECT COUNT(*) FROM system_logs");
                if (rs20.next()) {
                    log.info("[Init] system_logs 개수: {}", rs20.getInt(1));
                }

                ResultSet rs21 = st.executeQuery("SELECT COUNT(*) FROM daily_statistics");
                if (rs21.next()) {
                    log.info("[Init] daily_statistics 개수: {}", rs21.getInt(1));
                }

            }

        } catch (Exception e) {
            log.error("[Init] 에러 발생: ", e);
        }

        log.info("========================================");
        log.info("[Init] DummyDataInitializer done");
        log.info("========================================");
    }
}