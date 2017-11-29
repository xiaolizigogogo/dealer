package com.utonw.dealer.config;

import com.utonw.dealer.config.MybatisPlusConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;


@Configuration
@ComponentScan(basePackages={"com.utonw.dealer.api.service"})
@Import(value={MybatisPlusConfig.class})
public class SpringConfig {

}
