package com.example.hw4.Entity;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.validation.constraints.*;

@Data
@Document(collection = "stu")
public class stuEntity {

    @Field("id")
    @NotNull(message = "编号不为空")
    private Integer id;

    @Field("name")
    @NotEmpty(message = "姓名不为空")
    @Length(min=1,max=6,message = "姓名长度为1-6")
    private String name;

    @Field("age")
    @NotNull(message = "年龄不为空")
    @DecimalMax(value = "100",message = "年龄太大")
    @DecimalMin(value = "0",message = "年龄太小")
    private Integer age;

    @Field("sex")
    @NotNull(message = "性别不为空")
    @DecimalMax(value = "1",message = "性别异常")
    @DecimalMin(value = "0",message = "性别异常")
    private Integer sex;

    @Field("number")
    @NotEmpty(message = "身份证不为空")
    @Pattern(regexp = "(^[1-9]\\d{5}(19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}[0-9Xx]$)",
    message = "身份证格式错误")
    private String number;

    @Field("email")
    @Email
    @NotEmpty(message = "邮箱不为空")
    private String email;

    public stuEntity(){}

    public stuEntity(Integer id, String name, Integer age, Integer sex, String number, String email) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.number = number;
        this.email = email;
    }





}
