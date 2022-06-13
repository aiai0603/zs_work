package com.example.mqtt.Entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "recover", schema = "manager", catalog = "")
public class RecoverEntity {
    private int id;
    private Integer eid;
    private Integer temp;
    private Integer humi;
    private Timestamp sendTime;

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
    @Column(name = "temp")
    public Integer getTemp() {
        return temp;
    }

    public void setTemp(Integer temp) {
        this.temp = temp;
    }

    @Basic
    @Column(name = "humi")
    public Integer getHumi() {
        return humi;
    }

    public void setHumi(Integer humi) {
        this.humi = humi;
    }

    @Basic
    @Column(name = "send_time")
    public Timestamp getSendTime() {
        return sendTime;
    }

    public void setSendTime(Timestamp sendTime) {
        this.sendTime = sendTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RecoverEntity that = (RecoverEntity) o;
        return id == that.id &&
                Objects.equals(eid, that.eid) &&
                Objects.equals(temp, that.temp) &&
                Objects.equals(humi, that.humi) &&
                Objects.equals(sendTime, that.sendTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, eid, temp, humi, sendTime);
    }
}
