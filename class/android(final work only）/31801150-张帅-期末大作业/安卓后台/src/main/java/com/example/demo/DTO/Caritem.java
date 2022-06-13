package com.example.demo.DTO;

public class Caritem {
    String carname;
    String kinname;
    Integer money;

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname;
    }

    public String getKinname() {
        return kinname;
    }

    public void setKinname(String kinname) {
        this.kinname = kinname;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Integer getPayfirst() {
        return payfirst;
    }

    public void setPayfirst(Integer payfirst) {
        this.payfirst = payfirst;
    }

    public Integer getMonthpay() {
        return monthpay;
    }

    public void setMonthpay(Integer monthpay) {
        this.monthpay = monthpay;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    Integer payfirst;
    Integer monthpay;
    String img;
    Integer state;

    public Caritem(String carname, String kinname, Integer money, Integer payfirst, Integer monthpay, String img, Integer state) {
        this.carname = carname;
        this.kinname = kinname;
        this.money = money;
        this.payfirst = payfirst;
        this.monthpay = monthpay;
        this.img = img;
        this.state = state;
    }



}
