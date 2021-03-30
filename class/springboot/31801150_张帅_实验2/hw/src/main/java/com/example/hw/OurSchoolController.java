package com.example.hw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OurSchoolController {
    @Autowired
    OurSchoolBean ourSchoolBean;

    @RequestMapping("/school")
    public String hello(){
        return ourSchoolBean.getSchoolname();
    }
}
