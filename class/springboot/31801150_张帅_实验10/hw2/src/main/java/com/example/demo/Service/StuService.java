package com.example.demo.Service;


import com.example.demo.entity.Stu;
import com.example.demo.mapper.StuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;


@Service
@CacheConfig(cacheNames = "student")
public class StuService {
    @Autowired
    StuMapper stuMapper;

    @Autowired
    RedisTemplate redisTemplate;


    //private ZSetOperations zSetOperations;

    @Cacheable(key ="#p0")
    public Set rank(int n){
         List<Stu> re = stuMapper.queryAll();
         for(int i=0;i<re.size();i++){
             redisTemplate.opsForZSet().add("stu", re.get(i).getId(),re.get(i).getGpa());
         }

        return redisTemplate.opsForZSet().reverseRangeWithScores("stu",0,n-1);
    }




    @Cacheable(key ="#p0")
    public Stu findbyid(Integer id){

        return stuMapper.queryById(id);
    }

    @CachePut(key = "#p0")
    public void updataById(Stu stu){

        stuMapper.updateById(stu);
    }


    @CacheEvict(key ="#p0",allEntries=true)
    public void deleteById(Integer id){

        stuMapper.delById(id);
    }

    @CachePut(key ="#p0")
    public void add(Stu stu){

        stuMapper.add(stu);
    }


    @Cacheable(key ="#p0")
    public List<Stu> findall(){

        return stuMapper.queryAll();
    }




}