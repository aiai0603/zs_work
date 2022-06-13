package com.example.demo.dao;

import com.example.demo.entity.AuthorEntity;
import com.example.demo.entity.SaveEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SaveDAO extends JpaRepository<SaveEntity,Integer> {

    @Modifying
    @Query(value = "update save set deleteflag = 1 where userid=? and authorid=? and deleteflag=0",nativeQuery = true)
    void unstar(int uid,int aid);

   SaveEntity findByAuthoridIsAndUseridIsAndDeleteflagIs(int aid,int uid,int flag);


   SaveEntity save(SaveEntity saveEntity);
}
