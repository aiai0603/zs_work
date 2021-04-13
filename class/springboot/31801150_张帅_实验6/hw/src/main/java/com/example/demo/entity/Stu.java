package com.example.demo.entity;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;


@Entity
@Data
public class Stu extends BaseEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false, unique = true)
    @NotNull(message = "学号不能为空")
    private Integer sid;

    @Column(nullable = false)
    @NotEmpty(message = "姓名不能为空")
    @Length(min=1,max=6,message = "姓名长度为1-6")
    private String name;

    @Column(nullable = false)
    @NotNull(message = "性别不能为空")
    @DecimalMax(value = "1",message = "性别异常")
    @DecimalMin(value = "0",message = "性别异常")

    private Integer sex;

    @Column(nullable = false)
    @NotNull(message = "年龄不能为空")
    @DecimalMax(value = "100",message = "年龄太大")
    @DecimalMin(value = "0",message = "年龄太小")
    private Integer age;

    @Column(nullable = false)
    @NotEmpty(message = "邮箱不能为空")
    @Email
    private String email;

    @Column(nullable = false)
    @Pattern(regexp = "(^[1-9]\\d{5}(19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}[0-9Xx]$)",
            message = "身份证格式错误")
    @NotEmpty(message = "身份证不能为空")
    private String cardId;

}
