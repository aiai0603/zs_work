package com.example.demo.service;


import com.example.demo.entity.Stu;

import java.util.List;

public interface StuService {
    public List<Stu> getArticleList();

    public Stu findArticleById(long id);

}
