package com.example.demo.service.member;


import com.example.demo.entity.member.User;
import org.springframework.data.domain.Page;


public interface UserService {
    void save(User User);//保存用户
    Page<User> PageByUser(Integer page, Integer size);//对用户数据进行分页

}
