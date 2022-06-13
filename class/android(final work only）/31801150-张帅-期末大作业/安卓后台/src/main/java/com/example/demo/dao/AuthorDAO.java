package com.example.demo.dao;

import com.example.demo.entity.AuthorEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface AuthorDAO extends JpaRepository<AuthorEntity,Integer> {


    @Query(value = "select * from author where id in (select authorid from save where userid= ? and deleteflag = 0)  ",nativeQuery = true)
    List<AuthorEntity> findall(int id);

    AuthorEntity findById(int id);


}
