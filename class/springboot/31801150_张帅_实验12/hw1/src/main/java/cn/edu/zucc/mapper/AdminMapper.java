package cn.edu.zucc.mapper;

import cn.edu.zucc.entity.AdminEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface AdminMapper {

    @Select("SELECT * FROM admin WHERE user = #{user}")
    AdminEntity queryByUser(@Param("user") String user);

    @Select("SELECT * FROM admin WHERE id = #{id}")
    AdminEntity queryById(@Param("id") Integer id);




}
