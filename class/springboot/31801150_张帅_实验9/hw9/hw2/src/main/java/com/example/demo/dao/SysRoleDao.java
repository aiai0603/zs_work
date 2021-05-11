package com.example.demo.dao;

import com.example.demo.entity.SysRole;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SysRoleDao extends JpaRepository<SysRole,Long> {
public SysRole findByRole(String role);
        SysRole findById(long id);
}
