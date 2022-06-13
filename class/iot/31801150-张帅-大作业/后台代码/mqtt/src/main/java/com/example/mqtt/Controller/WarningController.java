package com.example.mqtt.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.mqtt.DAO.WarningDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/warning")
public class WarningController {

    @Autowired
    WarningDAO warningDAO;

    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject loginAdmin(@RequestParam(value = "eid") Integer id)  {

        JSONObject result=new JSONObject();
        result.put("data",warningDAO.findAll(id,0));
        result.put("port","200");
        return  result;

    }

    @RequestMapping(value="/deal",method= RequestMethod.GET)
    public JSONObject deal(@RequestParam(value = "id") Integer id)  {

        JSONObject result=new JSONObject();
        warningDAO.deal(id);
        result.put("port","200");
        return  result;

    }

}
