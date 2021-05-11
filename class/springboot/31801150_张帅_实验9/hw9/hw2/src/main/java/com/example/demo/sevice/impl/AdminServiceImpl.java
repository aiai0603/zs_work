package com.example.demo.sevice.impl;

import com.example.demo.dao.AdminDao;
import com.example.demo.entity.Admin;
import com.example.demo.sevice.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {
    //@Resource的作用相当于@Autowired，只不过@Autowired按byType自动注入，而@Resource默认按 byName自动注入
	@Resource
    private AdminDao adminDao;

    @Override
    public Admin findByUsername(String username) {
               return adminDao.findByUsername(username);
    }
}