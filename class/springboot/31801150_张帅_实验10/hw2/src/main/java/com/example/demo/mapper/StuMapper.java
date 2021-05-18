package com.example.demo.mapper;

import com.example.demo.entity.Stu;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface StuMapper {

    @Select("SELECT * FROM stu WHERE id = #{id}")
    Stu queryById(@Param("id") int id);

    @Select("SELECT * FROM stu WHERE sid = #{sid}")
    Stu queryBySid(@Param("sid") String sid);

    @Select("SELECT * FROM stu")
    List<Stu> queryAll();

    @Insert({"INSERT INTO stu(name,age,sex,sid,email,card_id,text,gpa) VALUES(#{name},#{age},#{sex},#{sid},#{email},#{card_id},#{text},#{gpa})"})
    int add(Stu stu);

    @Delete("DELETE FROM stu WHERE id = #{id}")
    int delById(int id);


    @Update("UPDATE stu SET name=#{name},age=#{age},sex=#{sex},sid=#{sid},email=#{email},card_id=#{card_id},text=#{text},gpa=#{gpa} WHERE id = #{id}")
    int updateById(Stu stu);

    @Select("SELECT * FROM stu")
    Page<Stu> getUserList();
}
