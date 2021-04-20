package com.example.demo.controller;

import com.example.demo.entity.Stu;
import com.example.demo.mapper.StuMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("stu")
public class StuController {
    @Autowired
    private StuMapper stuMapper;

    @RequestMapping("")
    public ModelAndView Stulist(@RequestParam(value = "start", defaultValue = "1") Integer start,
                                    @RequestParam(value = "limit", defaultValue = "5") Integer limit) {

        PageHelper.startPage(start,limit,"id desc");
        List<Stu> cs = stuMapper.queryAll();
        PageInfo<Stu> page = new PageInfo<>(cs);
        ModelAndView mav = new ModelAndView("stu/list");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/{id}")
    public ModelAndView getStu(@PathVariable("id") Integer id)  throws Exception {
        Stu stu = stuMapper.queryById(id);
        ModelAndView mav = new ModelAndView("stu/show");
        mav.addObject("stu", stu);
        return mav;
    }


    @GetMapping("/add")
    public String addStu( Stu model )   throws Exception{
        return "stu/add";
    }


    @PostMapping("")
    public String saveStu(@Valid  Stu model , BindingResult bindingResult)  throws Exception{


        if(bindingResult.hasErrors()){
            return "stu/add";
        }

        stuMapper.add(model);
        return "redirect:/stu";
    }

    @DeleteMapping("/{id}")
    public String del(@PathVariable("id") long id)  throws Exception{
        stuMapper.delById((int) id);
        return "redirect:";
    }

    @GetMapping("/edit/{id}")
    public ModelAndView editStu(@PathVariable("id") long id)  throws Exception {
        Stu model = stuMapper.queryById((int) id);
        ModelAndView mav = new ModelAndView("stu/edit");
        mav.addObject("stu", model);
        return mav;
    }

    @PostMapping("/{id}")
    public String editStuSave(@Valid Stu model,@PathVariable("id") long id)  throws Exception{


        model.setId(id);
        stuMapper.updateById(model);
        return "redirect:";
    }

}
