package com.example.mqtt.DAO;

import com.example.mqtt.Entity.AdminEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminDAO extends JpaRepository<AdminEntity,Integer> {

    AdminEntity findByUsernameIs(String username);
}
