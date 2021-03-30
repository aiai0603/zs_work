package com.example.hw4.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class MVCUser {
    private long id;
    private String name;
    private int age;
}
