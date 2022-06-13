package com.example.demo.dao;

import com.example.demo.DTO.Activityitem;
import com.example.demo.DTO.Caritem;
import com.example.demo.entity.BuyCarEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BuyCarDAO extends JpaRepository<BuyCarEntity,Integer> {

    BuyCarEntity save(BuyCarEntity buyCarEntity);

    @Query(value = "select new com.example.demo.DTO.Caritem(a.name,b.name,c.money,c.payfirst,c.monthpay,b.img,c.state) from CarEntity  a,CarKindEntity b,BuyCarEntity c where a.id=b.carid and c.carkind=b.id and c.userid=?1" )
    List<Caritem> findall(int id);
}
