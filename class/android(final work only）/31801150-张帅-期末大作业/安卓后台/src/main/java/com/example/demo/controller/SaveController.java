package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.PassageDAO;
import com.example.demo.dao.SaveDAO;
import com.example.demo.entity.SaveEntity;
import com.example.demo.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/save")
public class SaveController {

    @Autowired
    SaveDAO saveDAO;

    @RequestMapping(value="/unstar",method= RequestMethod.GET)
    public JSONObject unstar(@RequestParam(value="uid") int uid,@RequestParam(value="aid") int aid)  {



        JSONObject result=new JSONObject();
        result.put("port","200");
        saveDAO.unstar(uid,aid);
        return result;
    }


    @RequestMapping(value="/star",method= RequestMethod.GET)
    public JSONObject star(@RequestParam(value="uid") int uid,@RequestParam(value="aid") int aid)  {

        JSONObject result=new JSONObject();
        SaveEntity saveEntity=new SaveEntity();
        saveEntity.setAuthorid(aid);
        saveEntity.setUserid(uid);
        saveEntity.setDeleteflag(0);
        
        result.put("port","200");
        saveDAO.save(saveEntity);
        return result;
    }


}
