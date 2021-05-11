package com.example.demo.repository.member;


import com.example.demo.entity.member.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRoleRepository extends JpaRepository<UserRole,Long> {
	UserRole findByRolename(String name);
}
