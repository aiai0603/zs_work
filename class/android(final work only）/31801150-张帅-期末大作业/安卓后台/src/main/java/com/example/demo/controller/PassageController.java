package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.*;
import com.example.demo.entity.LikepageEntity;
import com.example.demo.entity.PassageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/passage")
public class PassageController {

    @Autowired
    PassageDAO passageDAO;

    @Autowired
    SaveDAO saveDAO;

    @Autowired
    AuthorDAO authorDAO;

    @Autowired
    LikePageDAO likePageDAO;

    @Autowired
    StarDAO starDAO;

    @Autowired
    CarDAO carDAO;



    @RequestMapping(value="/index",method= RequestMethod.GET)
    public JSONObject listUser(@RequestParam(value="page") int page)  {

            ArrayList<PassageEntity> pagelist = (ArrayList<PassageEntity>) passageDAO.findAllByTypeIs(1);

            JSONObject result=new JSONObject();
            result.put("port","200");
            if(pagelist.size()<(page*4))
            {
                result.put("data",null);
            }
            else {
                if (pagelist.size() > (page * 4 + 4))
                    result.put("data", pagelist.subList(page * 4, page * 4 + 4));
                else
                    result.put("data", pagelist.subList(page * 4, pagelist.size()));

            }
            return result;
    }


    @RequestMapping(value="/all",method= RequestMethod.GET)
    public JSONObject listpage()  {


        JSONObject result=new JSONObject();
        result.put("news",  (ArrayList<PassageEntity>) passageDAO.findTop2ByKindIs(1));
        result.put("design",  (ArrayList<PassageEntity>) passageDAO.findTop2ByKindIs(2));
        result.put("class",  (ArrayList<PassageEntity>) passageDAO.findTop2ByKindIs(3));
        result.put("amg",  (ArrayList<PassageEntity>) passageDAO.findTop2ByKindIs(4));
        result.put("history",  (ArrayList<PassageEntity>) passageDAO.findTop2ByKindIs(5));
        result.put("think",  (ArrayList<PassageEntity>) passageDAO.findTop2ByKindIs(6));

        return result;
    }

    @RequestMapping(value="/more",method= RequestMethod.GET)
    public JSONObject listmore(@RequestParam(value="kind") int kind)  {


        JSONObject result=new JSONObject();

        result.put("data",  (ArrayList<PassageEntity>) passageDAO.findByKindIs(kind));

        return result;
    }

    @RequestMapping(value="/page",method= RequestMethod.GET)
    public JSONObject findpage(@RequestParam(value="id") int pid)  {


        JSONObject result=new JSONObject();
        PassageEntity passageEntity=passageDAO.findById(pid);
        result.put("data", passageEntity);
        result.put("author",authorDAO.findById(passageEntity.getAuthor()));
        if(passageEntity.getRelevant()!=null)
            result.put("car",carDAO.findById(passageEntity.getRelevant()));
        else
            result.put("car",null);
        passageDAO.see(passageEntity.getId());

        return result;
    }


    @RequestMapping(value="/pageperson",method= RequestMethod.GET)
    public JSONObject findpagepersonal(@RequestParam(value="id") int pid,@RequestParam(value="uid") int uid)  {


        JSONObject result=new JSONObject();
        PassageEntity passageEntity=passageDAO.findById(pid);
        result.put("save", saveDAO.findByAuthoridIsAndUseridIsAndDeleteflagIs(passageEntity.getAuthor(),uid,0));

        result.put("like",likePageDAO.findByPassageidIsAndUseridIsAndDeleteflagIs(pid,uid,0));
        result.put("star",starDAO.findByPassageidIsAndUseridIs(pid,uid));


        return result;
    }



}
