package com.example.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.LikePageDAO;
import com.example.demo.dao.PassageDAO;
import com.example.demo.entity.LikepageEntity;
import com.example.demo.entity.PassageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/like")
public class LikeController {

    @Autowired
    LikePageDAO likePageDAO;

    @Autowired
    PassageDAO passageDAO;


    @RequestMapping(value="/add",method= RequestMethod.GET)
    public JSONObject likepage(@RequestParam(value="uid") int uid, @RequestParam(value="pid") int pid)  {

        LikepageEntity likepageEntity=new LikepageEntity();
        likepageEntity.setPassageid(pid);
        likepageEntity.setDeleteflag(0);
        likepageEntity.setUserid(uid);
        likePageDAO.save(likepageEntity);
        passageDAO.like(pid);

        JSONObject result=new JSONObject();
        result.put("port",200);


        return result;
    }



    @RequestMapping(value="/unlike",method= RequestMethod.GET)
    public JSONObject unlikepage(@RequestParam(value="uid") int uid, @RequestParam(value="pid") int pid)  {


        likePageDAO.unlike(uid, pid);
        passageDAO.unlike(pid);
        JSONObject result=new JSONObject();
        result.put("port",200);


        return result;
    }



    @RequestMapping(value="/all",method= RequestMethod.GET)
    public JSONObject unlikepage(@RequestParam(value="id") int id)  {

        JSONObject result=new JSONObject();
        result.put("data",passageDAO.findall(id));
        result.put("port",200);


        return result;
    }



}
