package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.CarKindDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/carkind")
public class CarKindController {

    @Autowired
    CarKindDAO carKindDAO;


    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject listallcar(@RequestParam(value="id") int id)  {

        JSONObject result=new JSONObject();


        result.put("data",carKindDAO.findAllByCaridIs(id));

        result.put("port","200");
        return result;

    }



}
