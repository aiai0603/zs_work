package com.example.demo.valid;

import com.example.demo.mapper.StuMapper;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/*
 *需要实现ConstraintValidator<A extends Annotation, T>
 *A extends Annotation:需要设置为自定义注解类型
 *T:需要校验数据的类型
 **/
public class MyConstraintValidator implements ConstraintValidator<MyValid, Object> {
    /**
     *初始化验证器，可以初始化验证注解
     *@param constraintAnnotation 验证注解的实例
     */
    @Autowired
    StuMapper stuMapper;


    @Override
    public boolean isValid(Object o, ConstraintValidatorContext constraintValidatorContext) {

        if (stuMapper.queryBySid(o.toString())==null){
            return true;
        }
        return false;
    }
}
