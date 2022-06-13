package com.example.mqtt.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.mqtt.DAO.AdminDAO;
import com.example.mqtt.Entity.AdminEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/admin")
public class AdminController {

    @Autowired
    AdminDAO adminDAO;

    @RequestMapping(value="/login",method= RequestMethod.GET)
    public JSONObject loginAdmin(@RequestParam(value = "username") String username,
                                 @RequestParam(value = "password") String password)  {


        JSONObject result=new JSONObject();
        AdminEntity adminEntity=adminDAO.findByUsernameIs(username);
        if(adminEntity==null){
            result.put("port","400");
            result.put("msg","账号不存在");
            return result;
        }
        else{
           if(adminEntity.getPassage().equals(password))
           {
               result.put("port","200");
               result.put("data", adminEntity);
               result.put("msg","登录成功");
               return result;
           }else{
               result.put("port","400");
               result.put("msg","密码错误");
               return result;
           }

        }

    }
}
