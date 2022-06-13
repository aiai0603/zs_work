package com.example.demo.dao;

import com.example.demo.entity.AuthorEntity;
import com.example.demo.entity.PassageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
public interface PassageDAO extends JpaRepository<PassageEntity,Integer> {


    List<PassageEntity> findAllByTypeIs(int type);
    List<PassageEntity> findTop2ByKindIs(int kind);
    List<PassageEntity> findByKindIs(int kind);

    PassageEntity findById(int id);

    @Modifying
    @Query(value = "update passage set see = see + 1 where id=?",nativeQuery = true)
    void see(int id);


    @Modifying
    @Query(value = "update passage set `like` = `like` + 1 where id=?",nativeQuery = true)
    void like(int id);

    @Modifying
    @Query(value = "update passage set `like` = `like` - 1 where id=?",nativeQuery = true)
    void unlike(int id);


    @Query(value = "select * from passage where id in (select passageid from likepage where userid= ? and deleteflag = 0)  ",nativeQuery = true)
    List<PassageEntity> findall(int id);


}
