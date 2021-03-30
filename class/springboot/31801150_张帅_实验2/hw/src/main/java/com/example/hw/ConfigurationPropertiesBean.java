package com.example.hw;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "demo")
public class ConfigurationPropertiesBean {
    private String sValue;
    private int nValue;

    public String toString(){
        return "{ sValue = "+sValue+",nValue = "+nValue+" }";
    }


}
