package com.example.demo.dao;

import com.example.demo.DTO.Activityitem;
import com.example.demo.entity.JoinactEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface JoinActDAO extends JpaRepository<JoinactEntity,Integer> {

    JoinactEntity save(JoinactEntity joinactEntity);

    @Query(value = "select new com.example.demo.DTO.Activityitem(b.id, a.name ,b.date ,b.deleteflag ) from ActEntity  a,JoinactEntity  b where b.userid=?1 and b.addressid=a.id and b.deleteflag=0 " )
    List<Activityitem> findall(int id);

}
