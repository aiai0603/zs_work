package com.example.mqtt.DAO;

import com.example.mqtt.Entity.EquipmentEntity;
import com.example.mqtt.Entity.RecoverEntity;
import com.example.mqtt.Entity.WarningEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.jmx.export.annotation.ManagedAttribute;

import java.util.List;

public interface WarningDAO extends JpaRepository<WarningEntity,Integer> {


    @Query(value = "select * from warning where eid = ?  and deal= ? ",nativeQuery = true)
    List<WarningEntity> findAll(int id, int deal);

    @Modifying
    @Query(value = "update warning set deal = 1 where  deal=0 and id=?",nativeQuery = true)
    void deal(int id );


    WarningEntity save (WarningEntity warningEntity);
}
