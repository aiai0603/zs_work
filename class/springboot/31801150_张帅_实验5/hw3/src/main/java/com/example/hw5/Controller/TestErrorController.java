package com.example.hw5.Controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/error")
public class TestErrorController implements ErrorController {

    @Override
    public String getErrorPath() {
        return null;
    }


    @RequestMapping
    public Map<String, Object> handleError() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 404);
        map.put("msg", "不存在");
        return map;
    }

    @RequestMapping("/ok")
    @ResponseBody
    public Map<String, Object> noError() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code ", 200);
        map.put("msg", "正常，这是测试页面");

        return map;
    }


}
