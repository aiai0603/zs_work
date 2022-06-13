package com.example.mqtt.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.mqtt.DAO.RecoverDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/recover")
public class recoverController {

    @Autowired
    RecoverDAO recoverDAO;


    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject loginAdmin(@RequestParam(value = "eid") Integer eid)  {

        JSONObject result=new JSONObject();
        result.put("data",recoverDAO.findtime(eid));
        result.put("port","200");
        return  result;

    }

}
