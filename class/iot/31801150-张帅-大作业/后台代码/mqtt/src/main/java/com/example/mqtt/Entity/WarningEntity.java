package com.example.mqtt.Entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "warning", schema = "manager", catalog = "")
public class WarningEntity {
    private int id;
    private Integer eid;
    private String msg;
    private Timestamp sendTime;
    private Integer deal;

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
    @Column(name = "msg")
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Basic
    @Column(name = "send_time")
    public Timestamp getSendTime() {
        return sendTime;
    }

    public void setSendTime(Timestamp sendTime) {
        this.sendTime = sendTime;
    }

    @Basic
    @Column(name = "deal")
    public Integer getDeal() {
        return deal;
    }

    public void setDeal(Integer deal) {
        this.deal = deal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WarningEntity that = (WarningEntity) o;
        return id == that.id &&
                Objects.equals(eid, that.eid) &&
                Objects.equals(msg, that.msg) &&
                Objects.equals(sendTime, that.sendTime) &&
                Objects.equals(deal, that.deal);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, eid, msg, sendTime, deal);
    }
}
