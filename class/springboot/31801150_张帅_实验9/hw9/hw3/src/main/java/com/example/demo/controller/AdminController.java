package com.example.demo.controller;

import com.example.demo.entity.AdminEntity;
import com.example.demo.entity.Stu;
import com.example.demo.jwt.JwtUtil;
import com.example.demo.jwt.PermitUtil;
import com.example.demo.mapper.AdminMapper;
import com.example.demo.mapper.StuMapper;
import com.example.demo.result.ExceptionMsg;
import com.example.demo.result.Response;
import com.example.demo.result.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("admin")
public class AdminController {



    @Autowired
    private AdminMapper adminMapper;

    @PostMapping("/enter")
    public ResponseData Stulist(@RequestBody AdminEntity admin ) {



        if(adminMapper.queryByUser(admin.getUser()) == null)
            return new ResponseData(new Response("405","账号不存在"),null);
        else if( !adminMapper.queryByUser(admin.getUser()).getPass().equals(admin.getPass())  )

            return new ResponseData(new Response("405","密码错误"),null);
        else {
            String token = null;
            try {
                token = JwtUtil.createToken(adminMapper.queryByUser(admin.getUser()).getRole(),
                        adminMapper.queryByUser(admin.getUser()).getId());
            } catch (Exception e) {
                e.printStackTrace();
            }

            return new ResponseData(ExceptionMsg.SUCCESS,token);
        }

    }





}
