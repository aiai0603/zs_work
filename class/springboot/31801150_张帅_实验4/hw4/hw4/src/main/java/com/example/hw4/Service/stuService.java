package com.example.hw4.Service;



import com.example.hw4.Entity.stuEntity;


import java.util.ArrayList;
import java.util.Optional;


public interface stuService {

    ArrayList<stuEntity> findall();

    void add(stuEntity stu);

    void remove(int id);

    stuEntity findbyid(int id);

    void update(stuEntity stu);
}

