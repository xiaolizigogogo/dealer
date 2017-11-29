package com.utonw.utonerp.config;

import com.alibaba.dubbo.config.ConsumerConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by WANGYJ on 2017/9/5.
 */
@Configuration
public class DubboConfig {
    @Value("${spring.dubbo.consumer.timeout}")
    private int timeout;

    @Bean
    public ConsumerConfig getDubboConsumerTimeout(){
        ConsumerConfig consumerConfig = new ConsumerConfig();
        consumerConfig.setTimeout(timeout);
        return consumerConfig;
    }
}
