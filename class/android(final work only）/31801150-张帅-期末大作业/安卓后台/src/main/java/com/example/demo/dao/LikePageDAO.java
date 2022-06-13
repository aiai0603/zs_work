package com.example.demo.dao;

import com.example.demo.entity.LikepageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface LikePageDAO extends JpaRepository<LikepageEntity,Integer> {

    LikepageEntity findByPassageidIsAndUseridIsAndDeleteflagIs(int pid,int uid,int flag);


    LikepageEntity save(LikepageEntity likepageEntity);

    @Modifying
    @Query(value = "update likepage set deleteflag = 1 where userid=? and passageid=? and deleteflag=0",nativeQuery = true)
    void unlike(int uid,int pid);




}
