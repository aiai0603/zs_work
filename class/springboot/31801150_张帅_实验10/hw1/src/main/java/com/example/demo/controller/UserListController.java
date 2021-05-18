package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.mapper.UserMapper;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserListController {
    @Autowired
    UserMapper userMapper;
    @RequestMapping("/listall")
    public String listCategory(Model m, @RequestParam(value="start",defaultValue="0")int start, @RequestParam(value = "size", defaultValue = "2") int size) throws Exception {

        PageHelper.startPage(start,size,"id desc");
        List<User> cs = userMapper.queryAll();
        PageInfo<User> page = new PageInfo<>(cs);
        m.addAttribute("page", page);
        return "list";
    }
}
