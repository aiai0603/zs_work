package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.OwnerCarDAO;
import com.example.demo.entity.OwnerCarEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/owner")
public class OwnerCarController {

    @Autowired
    OwnerCarDAO ownerCarDAO;

    @RequestMapping(value="/add",method= RequestMethod.POST)
    public JSONObject buycar(@RequestBody OwnerCarEntity ownerCarEntity)  {

        JSONObject result=new JSONObject();


        ownerCarDAO.save(ownerCarEntity);

        result.put("port","200");
        return result;

    }


    @RequestMapping(value="/find",method= RequestMethod.GET)
    public JSONObject findcar(@RequestParam(value = "id") int id)  {

        JSONObject result=new JSONObject();



        if( ownerCarDAO.findByUseridIs(id)==null)
            result.put("port","400");
        else
            result.put("port","200");
        return result;

    }


}
