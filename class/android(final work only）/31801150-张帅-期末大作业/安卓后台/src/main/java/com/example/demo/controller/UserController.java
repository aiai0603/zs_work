package com.example.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.demo.dao.UserDAO;
import com.example.demo.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;


@Transactional
@CrossOrigin
@RestController
@RequestMapping(value="/user")
public class UserController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping(value="/login",method= RequestMethod.GET)
    public JSONObject listUser(@RequestParam(value="phone") String phone)  {


        if(userDAO.findAllByPhone(phone).size()==0)
        {
            UserEntity userEntity=new UserEntity();
            userEntity.setPhone(phone);
            userDAO.save(userEntity);
        }
        JSONObject result=new JSONObject();
        result.put("port","200");
        result.put("data",userDAO.findAllByPhone(phone).get(0));
        return result;
    }

}
