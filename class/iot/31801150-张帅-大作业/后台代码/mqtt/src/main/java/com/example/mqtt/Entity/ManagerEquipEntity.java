package com.example.mqtt.Entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "manager_equip", schema = "manager", catalog = "")
public class ManagerEquipEntity {
    private int id;
    private Integer eid;
    private Integer deleteflag;
    private Integer uid;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "eid")
    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
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
    @Column(name = "uid")
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ManagerEquipEntity that = (ManagerEquipEntity) o;
        return id == that.id &&
                Objects.equals(eid, that.eid) &&
                Objects.equals(deleteflag, that.deleteflag) &&
                Objects.equals(uid, that.uid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, eid, deleteflag, uid);
    }
}
