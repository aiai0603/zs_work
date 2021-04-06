package com.example.hw5.Service;



import com.example.hw5.Entity.stuEntity;


import java.util.ArrayList;


public interface stuService {

    ArrayList<stuEntity> findall();

    void add(stuEntity stu);

    void remove(int id);

    stuEntity findbyid(int id);

    void update(stuEntity stu);
}

