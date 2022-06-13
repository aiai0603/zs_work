package com.example.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.ActDAO;
import com.example.demo.entity.LikepageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/act")
public class ActController {

    @Autowired
    ActDAO actDAO;

    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject listact()   {


        Date now=new Date();
        SimpleDateFormat myformat=new SimpleDateFormat("yyyy/MM/dd");
        String formatdate=myformat.format(now);

        JSONObject result=new JSONObject();
        result.put("data", actDAO.findAllByDateLessThanEqualAndDateendGreaterThanEqualAndIdIsNot(formatdate,formatdate,1));
        result.put("port",200);


        return result;
    }

}
