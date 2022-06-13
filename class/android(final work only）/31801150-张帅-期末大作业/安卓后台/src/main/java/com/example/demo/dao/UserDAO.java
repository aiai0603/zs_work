package com.example.demo.dao;

import com.example.demo.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface UserDAO extends JpaRepository<UserEntity,Integer> {


    UserEntity save(UserEntity userEntity);
    List<UserEntity> findAllByPhone(String phone);
}
