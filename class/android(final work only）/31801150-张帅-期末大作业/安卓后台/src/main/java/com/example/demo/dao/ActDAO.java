package com.example.demo.dao;

import com.example.demo.DTO.Activityitem;
import com.example.demo.entity.ActEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ActDAO extends JpaRepository<ActEntity,Integer> {

    List<ActEntity> findAllByDateLessThanEqualAndDateendGreaterThanEqualAndIdIsNot(String date1,String date2,int id);


}
