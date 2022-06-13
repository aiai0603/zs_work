package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "buy_car", schema = "benzapp", catalog = "")
public class BuyCarEntity {
    private int id;
    private Integer carid;
    private Integer carkind;
    private Integer money;
    private Integer payfirst;
    private Integer month;
    private Integer monthpay;
    private Integer userid;
    private Integer state;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "carid")
    public Integer getCarid() {
        return carid;
    }

    public void setCarid(Integer carid) {
        this.carid = carid;
    }

    @Basic
    @Column(name = "carkind")
    public Integer getCarkind() {
        return carkind;
    }

    public void setCarkind(Integer carkind) {
        this.carkind = carkind;
    }

    @Basic
    @Column(name = "money")
    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    @Basic
    @Column(name = "payfirst")
    public Integer getPayfirst() {
        return payfirst;
    }

    public void setPayfirst(Integer payfirst) {
        this.payfirst = payfirst;
    }

    @Basic
    @Column(name = "month")
    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    @Basic
    @Column(name = "monthpay")
    public Integer getMonthpay() {
        return monthpay;
    }

    public void setMonthpay(Integer monthpay) {
        this.monthpay = monthpay;
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
    @Column(name = "state")
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BuyCarEntity that = (BuyCarEntity) o;

        if (id != that.id) return false;
        if (carid != null ? !carid.equals(that.carid) : that.carid != null) return false;
        if (carkind != null ? !carkind.equals(that.carkind) : that.carkind != null) return false;
        if (money != null ? !money.equals(that.money) : that.money != null) return false;
        if (payfirst != null ? !payfirst.equals(that.payfirst) : that.payfirst != null) return false;
        if (month != null ? !month.equals(that.month) : that.month != null) return false;
        if (monthpay != null ? !monthpay.equals(that.monthpay) : that.monthpay != null) return false;
        if (userid != null ? !userid.equals(that.userid) : that.userid != null) return false;
        if (state != null ? !state.equals(that.state) : that.state != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (carid != null ? carid.hashCode() : 0);
        result = 31 * result + (carkind != null ? carkind.hashCode() : 0);
        result = 31 * result + (money != null ? money.hashCode() : 0);
        result = 31 * result + (payfirst != null ? payfirst.hashCode() : 0);
        result = 31 * result + (month != null ? month.hashCode() : 0);
        result = 31 * result + (monthpay != null ? monthpay.hashCode() : 0);
        result = 31 * result + (userid != null ? userid.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        return result;
    }
}
