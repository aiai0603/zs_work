package com.example.demo.dao;

import com.example.demo.entity.StarEntity;
import org.springframework.data.jpa.repository.JpaRepository;



public interface StarDAO extends JpaRepository<StarEntity,Integer> {


    StarEntity findByPassageidIsAndUseridIs(int pid, int uid);

    StarEntity save(StarEntity starEntity);
}
