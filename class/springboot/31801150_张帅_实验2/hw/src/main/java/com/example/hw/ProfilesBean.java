package com.example.hw;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "db")
public class ProfilesBean {
    private String admin;
    private String password;

    public String toString(){
        return " profile { admin = "+admin+" , password = "+password+" }";
    }


}
