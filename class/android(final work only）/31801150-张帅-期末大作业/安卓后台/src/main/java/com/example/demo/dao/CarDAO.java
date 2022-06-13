package com.example.demo.dao;

import com.example.demo.entity.CarEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarDAO extends JpaRepository<CarEntity,Integer> {

    @Override
    List<CarEntity> findAll();

    List<CarEntity> findByMoneyGreaterThanEqualAndMoneyLessThanEqualAndTypeIsOrderByMoneyAsc(int min,int max,int type);

    List<CarEntity> findByMoneyGreaterThanEqualAndMoneyLessThanEqualAndTypeIsOrderByMoneyDesc(int min,int max,int type);

    List<CarEntity> findByMoneyGreaterThanEqualAndMoneyLessThanEqualAndTypeIsOrderBySaleDesc(int min,int max,int type);

    List<CarEntity> findByMoneyGreaterThanEqualAndMoneyLessThanEqualOrderByMoneyAsc(int min,int max);

    List<CarEntity> findByMoneyGreaterThanEqualAndMoneyLessThanEqualOrderByMoneyDesc(int min,int max);

    List<CarEntity> findByMoneyGreaterThanEqualAndMoneyLessThanEqualOrderBySaleDesc(int min,int max);

    List<CarEntity> findTop2ByAndShowlineIs(int line);

    CarEntity findById(int id);
}
