package com.example.hw;

import lombok.Data;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Data
public class OurSchoolBean {
    private String schoolname;

    public OurSchoolBean(String schoolname) {
        this.schoolname = schoolname;
    }

    public OurSchoolBean(){}

}
