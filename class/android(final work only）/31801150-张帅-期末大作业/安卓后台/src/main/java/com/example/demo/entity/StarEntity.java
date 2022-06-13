package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "star", schema = "benzapp", catalog = "")
public class StarEntity {
    private int id;
    private Integer passageid;
    private Integer userid;
    private Integer starNumber;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "passageid")
    public Integer getPassageid() {
        return passageid;
    }

    public void setPassageid(Integer passageid) {
        this.passageid = passageid;
    }

    @Basic
    @Column(name = "userid")
    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "star_number")
    public Integer getStarNumber() {
        return starNumber;
    }

    public void setStarNumber(Integer starNumber) {
        this.starNumber = starNumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StarEntity that = (StarEntity) o;

        if (id != that.id) return false;
        if (passageid != null ? !passageid.equals(that.passageid) : that.passageid != null) return false;
        if (userid != null ? !userid.equals(that.userid) : that.userid != null) return false;
        if (starNumber != null ? !starNumber.equals(that.starNumber) : that.starNumber != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (passageid != null ? passageid.hashCode() : 0);
        result = 31 * result + (userid != null ? userid.hashCode() : 0);
        result = 31 * result + (starNumber != null ? starNumber.hashCode() : 0);
        return result;
    }
}
