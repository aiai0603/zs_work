package com.example.demo.service.impl;


import com.example.demo.entity.Stu;
import com.example.demo.repository.StuRepository;
import com.example.demo.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class StuServiceImpl implements StuService {
    @Autowired
    private StuRepository stuRepository;


    @Override
    public List<Stu> getArticleList() {
        return stuRepository.findAll();
    }


    @Override
    public Stu findArticleById(long id) {
        return stuRepository.findById(id);
    }


}

