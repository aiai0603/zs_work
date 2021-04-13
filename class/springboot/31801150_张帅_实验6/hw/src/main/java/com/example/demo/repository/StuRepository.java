package com.example.demo.repository;
import com.example.demo.entity.Stu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface StuRepository extends JpaRepository<Stu,Long> , JpaSpecificationExecutor<Stu> {
    Stu findById(long id);
}
