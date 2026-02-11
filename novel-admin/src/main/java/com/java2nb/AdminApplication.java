package com.java2nb;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.java2nb.common.exception.CommonExceptionHandler; // 导入冲突的异常处理器类
import javax.sql.DataSource;
import java.net.InetAddress;
import java.sql.Connection;

/**
 * 修复点说明：
 * 1. 移除手动声明的 log 变量（@Slf4j 已自动生成，避免重复）
 * 2. 将 excludeFilters 从 @SpringBootApplication 移到独立的 @ComponentScan 注解（符合注解规范）
 * 3. 保留所有原有业务逻辑和注解
 */
@EnableTransactionManagement
@ServletComponentScan
@MapperScan("com.java2nb.*.dao")
// 1. 恢复 @SpringBootApplication 原有写法（仅排除安全自动配置）
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
// 2. 单独添加 @ComponentScan，指定扫描包并排除冲突的异常处理器类（核心修复）
@ComponentScan(
    basePackages = "com.java2nb", // 扫描根包
    excludeFilters = {
        @ComponentScan.Filter(
            type = FilterType.ASSIGNABLE_TYPE,
            classes = CommonExceptionHandler.class // 排除冲突的异常处理器类
        )
    }
)
@EnableCaching
@Slf4j // 自动生成 log 变量，无需手动声明
public class AdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(AdminApplication.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(ApplicationContext ctx, DataSource dataSource) {
        return args -> {
            log.info("创建连接池...");
            try (Connection connection = dataSource.getConnection()) {
                log.info("连接池已创建.");
                log.info("数据库：{}", connection.getMetaData().getDatabaseProductName());
                log.info("数据库版本：{}", connection.getMetaData().getDatabaseProductVersion());
            }
            log.info("项目启动啦，访问路径：{}",
                "http://" + InetAddress.getLocalHost().getHostAddress() + ":" + ctx.getEnvironment()
                    .getProperty("server.port"));
        };
    }
}