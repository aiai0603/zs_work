package com.example.hw4.Service;

import com.example.hw4.DAO.stuDAO;
import com.example.hw4.Entity.stuEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service
public class stuServiceImpl implements stuService{

    @Autowired
    private MongoTemplate mongoTemplate;

    @Autowired
    stuDAO stuDAO;

    @Override
    public ArrayList<stuEntity> findall() {
        return (ArrayList<stuEntity>) stuDAO.findAll();
    }

    @Override
    public void add(stuEntity stu) {
        stuDAO.save(stu);
    }

    @Override
    public void remove(int id) {
        Query query = new Query(Criteria.where("id").is(id));//查找其id字段的值与传入参数id相等的数据
        mongoTemplate.remove(query, stuEntity.class);
    }

    @Override
    public stuEntity findbyid(int id) {
        Query query = new Query(Criteria.where("id").is(id));
        stuEntity stuEntity = mongoTemplate.findOne(query,stuEntity.class);
        return stuEntity;

    }

    @Override
    public void update(stuEntity stu) {
        Query query = new Query(Criteria.where("id").is(stu.getId()));
        Update update = new Update().set("name",stu.getName()).set("id",stu.getId()).set("email",stu.getEmail()).set("number",
                stu.getNumber()).set("sex",stu.getSex()).set("age",stu.getAge());
        mongoTemplate.updateFirst(query,update,stuEntity.class);

    }


}


