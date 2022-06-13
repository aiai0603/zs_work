package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "act", schema = "benzapp", catalog = "")
public class ActEntity {
    private int id;
    private String name;
    private String img;
    private String date;
    private Integer allpeople;
    private Integer nowpeople;
    private String dateend;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "img")
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Basic
    @Column(name = "date")
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "allpeople")
    public Integer getAllpeople() {
        return allpeople;
    }

    public void setAllpeople(Integer allpeople) {
        this.allpeople = allpeople;
    }

    @Basic
    @Column(name = "nowpeople")
    public Integer getNowpeople() {
        return nowpeople;
    }

    public void setNowpeople(Integer nowpeople) {
        this.nowpeople = nowpeople;
    }

    @Basic
    @Column(name = "dateend")
    public String getDateend() {
        return dateend;
    }

    public void setDateend(String dateend) {
        this.dateend = dateend;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ActEntity actEntity = (ActEntity) o;

        if (id != actEntity.id) return false;
        if (name != null ? !name.equals(actEntity.name) : actEntity.name != null) return false;
        if (img != null ? !img.equals(actEntity.img) : actEntity.img != null) return false;
        if (date != null ? !date.equals(actEntity.date) : actEntity.date != null) return false;
        if (allpeople != null ? !allpeople.equals(actEntity.allpeople) : actEntity.allpeople != null) return false;
        if (nowpeople != null ? !nowpeople.equals(actEntity.nowpeople) : actEntity.nowpeople != null) return false;
        if (dateend != null ? !dateend.equals(actEntity.dateend) : actEntity.dateend != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (allpeople != null ? allpeople.hashCode() : 0);
        result = 31 * result + (nowpeople != null ? nowpeople.hashCode() : 0);
        result = 31 * result + (dateend != null ? dateend.hashCode() : 0);
        return result;
    }
}
