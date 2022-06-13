package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.StarDAO;
import com.example.demo.dao.UserDAO;
import com.example.demo.entity.StarEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/star")
public class StarController {

    @Autowired
    StarDAO starDAO;

    @RequestMapping(value="/rate",method= RequestMethod.GET)
    public JSONObject unstar(@RequestParam(value="pid") int pid, @RequestParam(value="uid") int uid, @RequestParam(value="rate") int star)  {


        StarEntity starEntity=starDAO.findByPassageidIsAndUseridIs(pid,uid);
        if(starEntity==null)
        {
            starEntity=new StarEntity();
            starEntity.setPassageid(pid);
            starEntity.setUserid(uid);
        }
        starEntity.setStarNumber(star);
        JSONObject result=new JSONObject();
        starDAO.save(starEntity);
        result.put("port","200");
        return result;
    }

}
