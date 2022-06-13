package com.example.mqtt.DAO;

import com.example.mqtt.Entity.RecoverEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RecoverDAO extends JpaRepository<RecoverEntity,Integer> {

    RecoverEntity save(RecoverEntity recoverEntity);

    @Query(value = "select  *  from recover where send_time >=(NOW() - interval 24 hour) and eid=?",nativeQuery = true)
    List<RecoverEntity> findtime(int id);
}
