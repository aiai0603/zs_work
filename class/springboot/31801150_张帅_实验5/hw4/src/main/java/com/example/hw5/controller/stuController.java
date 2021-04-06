package com.example.hw5.controller;

import com.example.hw5.Entity.stuEntity;
import com.example.hw5.Service.stuService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    stuService stuService;


    @RequestMapping(value = "/")
    String index(){


        return "index";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    ModelAndView listdata(int page){
        ModelAndView mav = new ModelAndView("list");

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

        stuService.add(stu);
        attr.addFlashAttribute("stu",stu);
        return "redirect:/result";
    }

    @RequestMapping(value = "/remove",method = RequestMethod.GET)
    String  re(int id){

        stuService.remove(id);
        return "remove";
    }


    @RequestMapping(value = "/modify",method = RequestMethod.GET)
    ModelAndView change(int id){
        ModelAndView mav = new ModelAndView("modify");
        stuEntity stu = stuService.findbyid(id);
        mav.addObject("stuEntity",stu);
        return mav;
    }

    @RequestMapping(value = "/modify",method = RequestMethod.POST)
    String changedata(@Valid stuEntity stu, BindingResult bindingResult, RedirectAttributes attr){

        if(bindingResult.hasErrors()){
            return "modify";
        }
      
        stuService.update(stu);
        attr.addFlashAttribute("stu",stu);
        return "redirect:/result";
    }




}
