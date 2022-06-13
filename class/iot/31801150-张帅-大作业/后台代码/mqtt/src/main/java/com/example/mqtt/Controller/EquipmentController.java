package com.example.mqtt.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.mqtt.DAO.EquipmentDAO;
import com.example.mqtt.Entity.EquipmentEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/equip")
public class EquipmentController {
    @Autowired
    EquipmentDAO equipmentDAO;

    @RequestMapping(value="/list",method= RequestMethod.GET)
    public JSONObject loginAdmin(@RequestParam(value = "id") Integer id)  {


        JSONObject result=new JSONObject();


        result.put("data",  equipmentDAO.findAll(id));
        result.put("port","200");
        return  result;




    }


    @RequestMapping(value="/check",method= RequestMethod.GET)
    public JSONObject check(@RequestParam(value = "id") Integer id,@RequestParam(value = "check") Integer check)  {


        JSONObject result=new JSONObject();


        equipmentDAO.check(check,id);
        result.put("port","200");
        return  result;




    }

}
