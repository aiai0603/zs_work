package com.example.demo.dao;

import com.example.demo.entity.CarKindEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarKindDAO extends JpaRepository<CarKindEntity,Integer> {

    List<CarKindEntity> findAllByCaridIs(int carid);
}
