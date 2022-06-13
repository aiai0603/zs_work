package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "car", schema = "benzapp", catalog = "")
public class CarEntity {
    private int id;
    private String name;
    private Integer money;
    private Integer newCar;
    private Integer sale;
    private Integer type;
    private Integer showline;
    private String img;
    private String shortName;
    private String showimg;

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
    @Column(name = "money")
    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    @Basic
    @Column(name = "new_car")
    public Integer getNewCar() {
        return newCar;
    }

    public void setNewCar(Integer newCar) {
        this.newCar = newCar;
    }

    @Basic
    @Column(name = "sale")
    public Integer getSale() {
        return sale;
    }

    public void setSale(Integer sale) {
        this.sale = sale;
    }

    @Basic
    @Column(name = "type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Basic
    @Column(name = "showline")
    public Integer getShowline() {
        return showline;
    }

    public void setShowline(Integer showline) {
        this.showline = showline;
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
    @Column(name = "short_name")
    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    @Basic
    @Column(name = "showimg")
    public String getShowimg() {
        return showimg;
    }

    public void setShowimg(String showimg) {
        this.showimg = showimg;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CarEntity carEntity = (CarEntity) o;

        if (id != carEntity.id) return false;
        if (name != null ? !name.equals(carEntity.name) : carEntity.name != null) return false;
        if (money != null ? !money.equals(carEntity.money) : carEntity.money != null) return false;
        if (newCar != null ? !newCar.equals(carEntity.newCar) : carEntity.newCar != null) return false;
        if (sale != null ? !sale.equals(carEntity.sale) : carEntity.sale != null) return false;
        if (type != null ? !type.equals(carEntity.type) : carEntity.type != null) return false;
        if (showline != null ? !showline.equals(carEntity.showline) : carEntity.showline != null) return false;
        if (img != null ? !img.equals(carEntity.img) : carEntity.img != null) return false;
        if (shortName != null ? !shortName.equals(carEntity.shortName) : carEntity.shortName != null) return false;
        if (showimg != null ? !showimg.equals(carEntity.showimg) : carEntity.showimg != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (money != null ? money.hashCode() : 0);
        result = 31 * result + (newCar != null ? newCar.hashCode() : 0);
        result = 31 * result + (sale != null ? sale.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (showline != null ? showline.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (shortName != null ? shortName.hashCode() : 0);
        result = 31 * result + (showimg != null ? showimg.hashCode() : 0);
        return result;
    }
}
