package com.example.hw;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class HwApplicationTests {

    @Autowired
    private ConfigurationPropertiesBean configurationPropertiesBean;

    @Autowired
    private ConfigurationPropertiesBeanValue configurationPropertiesBeanValue;



    @Test
    void contextLoads() {

        System.out.println(configurationPropertiesBean);
        System.out.println(configurationPropertiesBeanValue);
    }

}
