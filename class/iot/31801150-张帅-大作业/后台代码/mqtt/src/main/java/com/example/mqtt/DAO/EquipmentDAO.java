package com.example.mqtt.DAO;

import com.example.mqtt.Entity.AdminEntity;
import com.example.mqtt.Entity.EquipmentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EquipmentDAO extends JpaRepository<EquipmentEntity,Integer> {

    @Query(value = "select * from equipment where id in (select eid from manager_equip where uid=? and deleteflag=0)",nativeQuery = true)
    List<EquipmentEntity> findAll(int id);

    EquipmentEntity findByEname(String ename);

    @Modifying
    @Query(value = "update equipment set deleteflag = ? where id=? ",nativeQuery = true)
    void check(int flag,int id);


    EquipmentEntity save(EquipmentEntity equipmentEntity);



}
