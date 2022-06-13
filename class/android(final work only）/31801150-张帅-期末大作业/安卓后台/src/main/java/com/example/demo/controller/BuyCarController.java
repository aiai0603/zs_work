package com.example.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.BuyCarDAO;
import com.example.demo.entity.BuyCarEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/buycar")
public class BuyCarController {

    @Autowired
    BuyCarDAO buyCarDAO;

    @RequestMapping(value="/add",method= RequestMethod.POST)
    public JSONObject buycar(@RequestBody BuyCarEntity buyCarEntity)  {

        JSONObject result=new JSONObject();


       buyCarDAO.save(buyCarEntity);

        result.put("port","200");
        return result;

    }


    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject listbuycar(@RequestParam(value = "id") int id)  {

        JSONObject result=new JSONObject();
        result.put("data",buyCarDAO.findall(id));
        result.put("port","200");
        return result;

    }

}
