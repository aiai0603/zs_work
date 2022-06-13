package com.example.demo.dao;

import com.example.demo.controller.OwnerCarController;
import com.example.demo.entity.OwnerCarEntity;
import com.example.demo.entity.PassageEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OwnerCarDAO extends JpaRepository<OwnerCarEntity,Integer> {



    OwnerCarEntity save(OwnerCarEntity ownerCarEntity);

    OwnerCarEntity findByUseridIs(int id);



}
