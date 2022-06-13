package com.example.mqtt.DAO;


import com.example.mqtt.Entity.EquipmentEntity;
import com.example.mqtt.Entity.ManagerEquipEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ManagerDAO extends JpaRepository<ManagerEquipEntity,Integer> {


    @Modifying
    @Query(value = "update manager_equip set deleteflag = 1  where eid=? and uid = ?  and deleteflag=0",nativeQuery = true)
    void unmanager(int eid,int uid);

    ManagerEquipEntity save(ManagerEquipEntity managerEquipEntity);

    ManagerEquipEntity findByDeleteflagIsAndEidIsAndUidIs(int flag,int eid,int uid);


}
