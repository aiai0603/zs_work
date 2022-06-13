package com.example.demo.DTO;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

@Data
public class Activityitem implements Serializable {



    private Integer id;
    private String name;
    private String date;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getDeleteflag() {
        return deleteflag;
    }

    public void setDeleteflag(Integer deleteflag) {
        this.deleteflag = deleteflag;
    }

    private Integer deleteflag;

    public Activityitem(int id,String name, String date, Integer deleteflag) {
        this.id=id;
        this.name = name;
        this.date = date;
        this.deleteflag = deleteflag;
    }
















}
