package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.JoinActDAO;
import com.example.demo.entity.JoinactEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/join")
public class JoinactController {

    @Autowired
    JoinActDAO joinActDAO;

    @RequestMapping(value="/unjoin",method= RequestMethod.POST)
    public JSONObject listjoin(@RequestBody JoinactEntity joinactEntity)  {

        JSONObject result=new JSONObject();
        joinactEntity.setDeleteflag(1);
        joinActDAO.save(joinactEntity);
        result.put("port","200");
        return result;

    }




    @RequestMapping(value="/add",method= RequestMethod.POST)
    public JSONObject addjoin(@RequestBody JoinactEntity joinactEntity)  {

        joinActDAO.save(joinactEntity);
        JSONObject result=new JSONObject();
        result.put("port","200");
        return result;

    }

    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject listjoin(@RequestParam(value = "id") int id)  {

        JSONObject result=new JSONObject();
        result.put("data",joinActDAO.findall(id));
        result.put("port","200");
        return result;

    }

}
