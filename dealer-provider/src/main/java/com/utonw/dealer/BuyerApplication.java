package com.utonw.dealer;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@MapperScan("com.utonw.dealer.mapper")
@SpringBootApplication
@EnableTransactionManagement
@ComponentScan(basePackages={"com.utonw"})
@EnableAutoConfiguration
public class BuyerApplication {

	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(BuyerApplication.class);
		app.setBannerMode(Banner.Mode.OFF);
		app.run(args);
	}
}
