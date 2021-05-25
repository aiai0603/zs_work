package com.example.demo.mapper;

import com.example.demo.entity.AdminEntity;
import com.example.demo.entity.Stu;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface AdminMapper {

    @Select("SELECT * FROM admin WHERE user = #{user}")
    AdminEntity queryByUser(@Param("user") String user);

    @Select("SELECT * FROM admin WHERE id = #{id}")
    AdminEntity queryById(@Param("id") Integer id);




}
