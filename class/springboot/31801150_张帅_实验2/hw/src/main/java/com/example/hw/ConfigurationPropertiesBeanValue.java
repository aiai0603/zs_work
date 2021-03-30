package com.example.hw;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@Component
public class ConfigurationPropertiesBeanValue {
    @Value("${demo-value.string}")
    private String sValue;
    @Value("${demo-value.int}")
    private int nValue;


    public String toString(){
        return "{ sValue = "+sValue+",nValue = "+nValue+" }";
    }
}
