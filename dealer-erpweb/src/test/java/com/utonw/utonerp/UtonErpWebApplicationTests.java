package com.utonw.utonerp;


import org.dozer.DozerBeanMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SuppressWarnings("ALL")
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = UtonErpWebApplicationTests.class, webEnvironment = SpringBootTest.WebEnvironment.MOCK)
public class UtonErpWebApplicationTests {
    @Autowired
    private DozerBeanMapper dozerBeanMapper;

    @Test
    public void testdozer(){
    	
    }
}
