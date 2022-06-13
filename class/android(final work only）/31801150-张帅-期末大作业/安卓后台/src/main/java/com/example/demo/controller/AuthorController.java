package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.AuthorDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/author")
public class AuthorController {

    @Autowired
    AuthorDAO authorDAO;

    @RequestMapping(value="/save",method= RequestMethod.GET)
    public JSONObject listUser(@RequestParam(value="id") int id)  {



        JSONObject result=new JSONObject();
        result.put("port","200");

        result.put("data",authorDAO.findall(id));

        return result;
    }

}
