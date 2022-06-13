package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "save", schema = "benzapp", catalog = "")
public class SaveEntity {
    private int id;
    private int userid;
    private int authorid;
    private int deleteflag;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "userid")
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "authorid")
    public int getAuthorid() {
        return authorid;
    }

    public void setAuthorid(int authorid) {
        this.authorid = authorid;
    }

    @Basic
    @Column(name = "deleteflag")
    public int getDeleteflag() {
        return deleteflag;
    }

    public void setDeleteflag(int deleteflag) {
        this.deleteflag = deleteflag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SaveEntity that = (SaveEntity) o;

        if (id != that.id) return false;
        if (userid != that.userid) return false;
        if (authorid != that.authorid) return false;
        if (deleteflag != that.deleteflag) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + userid;
        result = 31 * result + authorid;
        result = 31 * result + deleteflag;
        return result;
    }
}
