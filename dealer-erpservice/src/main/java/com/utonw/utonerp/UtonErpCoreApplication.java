package com.utonw.utonerp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages={"com.utonw.utonerp.mapper*","com.utonw.event.mapper"})
@EnableTransactionManagement
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@ServletComponentScan
@EnableAspectJAutoProxy(proxyTargetClass = true)
@EnableScheduling
@EnableConfigurationProperties
@ComponentScan(basePackages = "com.utonw")
public class UtonErpCoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(UtonErpCoreApplication.class, args);
	}
}
