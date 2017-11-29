package com.utonw.utonerp.config;

import org.dozer.DozerBeanMapper;
import org.dozer.spring.DozerBeanMapperFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.ResourceArrayPropertyEditor;

/**
 * Created by WANGYJ on 2017/8/28.
 */
@Configuration
public class DozerConfig {
    @Bean
    public DozerBeanMapperFactoryBean getDozerBeanMapperFactoryBean(ApplicationContext applicationContext){
        DozerBeanMapperFactoryBean factoryBean = new DozerBeanMapperFactoryBean();
        ResourceArrayPropertyEditor editor = new ResourceArrayPropertyEditor();
        editor.setAsText("classpath*:/dozer/**/*.xml");
        factoryBean.setMappingFiles((Resource[]) editor.getValue());
        factoryBean.setApplicationContext(applicationContext);
        return factoryBean;
    }
    @Bean
    public DozerBeanMapper getDozerBeanMapper(ApplicationContext applicationContext) throws Exception{

        return (DozerBeanMapper)getDozerBeanMapperFactoryBean(applicationContext).getObject();

    }

}
