package com.example.hw3.controller;

import com.example.hw3.Entity.stuEntity;
import org.springframework.http.server.DelegatingServerHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class stuController {
    ArrayList<stuEntity> list = new ArrayList<>();
    @RequestMapping(value = "/")
    String index(){

        if(list.size()==0)
        {
            list.add(new stuEntity(1,"zs",20,1,"33048120000603001X","1016868503@qq.com"));
            list.add(new stuEntity(2,"zs",20,1,"33048120000603001X","1016868503@qq.com"));
            list.add(new stuEntity(3,"zs",20,1,"33048120000603001X","1016868503@qq.com"));
            list.add(new stuEntity(4,"zs",20,1,"33048120000603001X","1016868503@qq.com"));
            list.add(new stuEntity(5,"zs",20,1,"33048120000603001X","1016868503@qq.com"));
            list.add(new stuEntity(6,"zs",20,1,"33048120000603001X","1016868503@qq.com"));
            list.add(new stuEntity(7,"zs",20,1,"33048120000603001X","1016868503@qq.com"));
            list.add(new stuEntity(8,"zs",20,1,"33048120000603001X","1016868503@qq.com"));

        }
        return "index";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    ModelAndView listdata(int page){
        ModelAndView mav = new ModelAndView("list");

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
        System.out.println(list.size());
        mav.addObject("flag",flag);
        mav.addObject("msg",re);
        mav.addObject("sum",(list.size()-1)/3);
        mav.addObject("index",page);
        return mav;
    }



    @RequestMapping(value = "/add",method = RequestMethod.GET)
    String add(stuEntity stu){

        return "add";
    }

    @RequestMapping(value = "/result",method = RequestMethod.GET)
    String show(){

        return "result";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    String addata(@Valid stuEntity stu, BindingResult bindingResult, RedirectAttributes attr){

        if(bindingResult.hasErrors()){
            return "add";
        }
        System.out.println(stu.getSex());
        list.add(stu);
        attr.addFlashAttribute("stu",stu);
        return "redirect:/result";
    }




}
