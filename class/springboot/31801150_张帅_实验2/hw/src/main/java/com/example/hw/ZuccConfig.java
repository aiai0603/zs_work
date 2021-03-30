package com.example.hw;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Data
@Configuration
@EnableConfigurationProperties(ZuccConfig.class)

@ConfigurationProperties(prefix = "zucc")
public class ZuccConfig {
    private int year;

    @Bean
    public  OurSchoolBean ourSchool(){
        System.out.println(year);
        if(year<2020){
            return  new OurSchoolBean("浙江大学城市学院");
        }else{
            return  new OurSchoolBean("浙大城市学院");
        }
    }

}
