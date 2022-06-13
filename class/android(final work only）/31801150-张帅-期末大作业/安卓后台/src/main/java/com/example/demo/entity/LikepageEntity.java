package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "likepage", schema = "benzapp", catalog = "")
public class LikepageEntity {
    private int id;
    private Integer passageid;
    private Integer userid;
    private Integer deleteflag;

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
    @Column(name = "deleteflag")
    public Integer getDeleteflag() {
        return deleteflag;
    }

    public void setDeleteflag(Integer deleteflag) {
        this.deleteflag = deleteflag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LikepageEntity that = (LikepageEntity) o;

        if (id != that.id) return false;
        if (passageid != null ? !passageid.equals(that.passageid) : that.passageid != null) return false;
        if (userid != null ? !userid.equals(that.userid) : that.userid != null) return false;
        if (deleteflag != null ? !deleteflag.equals(that.deleteflag) : that.deleteflag != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (passageid != null ? passageid.hashCode() : 0);
        result = 31 * result + (userid != null ? userid.hashCode() : 0);
        result = 31 * result + (deleteflag != null ? deleteflag.hashCode() : 0);
        return result;
    }
}
