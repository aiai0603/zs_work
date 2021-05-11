package com.example.demo.controller;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class HomeController {
    @RequestMapping({"/", "/index"})
    public String index() {
        return "/index";
    }
    @RequestMapping("/login")
    public String login(HttpServletRequest request, Map<String, Object> map) throws Exception {

        String exception = (String) request.getAttribute("shiroLoginFailure");
        System.out.println("exception=" + exception);
        String msg = "";
        if (exception != null) {
            if (UnknownAccountException.class.getName().equals(exception)) {
                       msg = "账号不存在：";
            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
                         msg = "密码不正确：";
            } else if ("kaptchaValidateFailed".equals(exception)) {
                             msg = "验证码错误";
            } else {
                msg = "else >> " + exception;

            }
        }
        map.put("msg", msg);

        return "/login";
    }
    @RequestMapping("/403")
    public String unauthorizedRole() {
        return "403";
    }
}