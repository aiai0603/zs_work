package com.example.demo.controller;



import com.example.demo.entity.Log;
import com.example.demo.exception.BusinessException;
import com.example.demo.repository.LogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.ValidationException;
import java.lang.reflect.Array;
import java.util.ArrayList;


@RestController
public class LogController {

    @Autowired
    LogRepository logRepository;

    @GetMapping(value = "/log")
    public ArrayList<Log> findlog(@RequestParam("admin") String admin){
        ArrayList<Log> re= (ArrayList<Log>) logRepository.findAllByAdmin(admin);
        return re;
    }
}
