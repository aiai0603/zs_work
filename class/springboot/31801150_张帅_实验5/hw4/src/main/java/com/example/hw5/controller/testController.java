package com.example.hw5.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.hw5.Entity.stuEntity;
import com.example.hw5.Service.stuService;
import netscape.javascript.JSObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/test")
public class testController {

    @Autowired
    stuService stuService;

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    JSONObject listdata(int page){
        JSONObject jsonObject = new JSONObject();
        ArrayList<stuEntity> list = stuService.findall();
        int flag=0;
        List<stuEntity> re;
        if(page * 3+3 < list.size()) {
            flag = 0;
            re = list.subList(page * 3, page * 3 + 3);
        }
        else
        {
            flag = 1;
            re =  list.subList(page * 3,list.size());
        }

        jsonObject.put("flag",flag);
        jsonObject.put("msg",re);
        jsonObject.put("sum",(list.size()-1)/3);
        jsonObject.put("index",page);
        return jsonObject;
    }

    @RequestMapping(value = "/find",method = RequestMethod.GET)
    stuEntity mo(int id){
        stuService.findbyid(id);
        return stuService.findbyid(id);
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    String addata(@Valid @RequestBody  stuEntity stu, BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return "add error";
        }
        stuService.add(stu);
        return "add success id = "+stu.getId();
    }

    @RequestMapping(value = "/remove",method = RequestMethod.GET)
    String  re(int id){

        stuService.remove(id);
        return "remove success id = "+id;
    }

    @RequestMapping(value = "/modify",method = RequestMethod.POST)
    String changedata(@Valid @RequestBody stuEntity stu, BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return "modify error";
        }
        stuService.update(stu);
        return "modify success id = "+stu.getId();
    }

}
