package com.example.mqtt.Entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "equipment", schema = "manager", catalog = "")
public class EquipmentEntity {
    private int id;
    private String ename;
    private Integer state;
    private Integer deleteflag;
    private Integer lowert;
    private Integer hight;
    private Integer lowerh;
    private Integer highh;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ename")
    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    @Basic
    @Column(name = "state")
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Basic
    @Column(name = "deleteflag")
    public Integer getDeleteflag() {
        return deleteflag;
    }

    public void setDeleteflag(Integer deleteflag) {
        this.deleteflag = deleteflag;
    }

    @Basic
    @Column(name = "lowert")
    public Integer getLowert() {
        return lowert;
    }

    public void setLowert(Integer lowert) {
        this.lowert = lowert;
    }

    @Basic
    @Column(name = "hight")
    public Integer getHight() {
        return hight;
    }

    public void setHight(Integer hight) {
        this.hight = hight;
    }

    @Basic
    @Column(name = "lowerh")
    public Integer getLowerh() {
        return lowerh;
    }

    public void setLowerh(Integer lowerh) {
        this.lowerh = lowerh;
    }

    @Basic
    @Column(name = "highh")
    public Integer getHighh() {
        return highh;
    }

    public void setHighh(Integer highh) {
        this.highh = highh;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EquipmentEntity that = (EquipmentEntity) o;
        return id == that.id &&
                Objects.equals(ename, that.ename) &&
                Objects.equals(state, that.state) &&
                Objects.equals(deleteflag, that.deleteflag) &&
                Objects.equals(lowert, that.lowert) &&
                Objects.equals(hight, that.hight) &&
                Objects.equals(lowerh, that.lowerh) &&
                Objects.equals(highh, that.highh);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ename, state, deleteflag, lowert, hight, lowerh, highh);
    }
}
