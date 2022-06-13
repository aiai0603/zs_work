package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "passage", schema = "benzapp", catalog = "")
public class PassageEntity {
    private int id;
    private String title;
    private int type;
    private int author;
    private int see;
    private int like;
    private String img1;
    private String img2;
    private String img3;
    private String date;
    private String video;
    private Integer relevant;
    private String inside;
    private Integer kind;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Basic
    @Column(name = "author")
    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    @Basic
    @Column(name = "see")
    public int getSee() {
        return see;
    }

    public void setSee(int see) {
        this.see = see;
    }

    @Basic
    @Column(name = "like")
    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    @Basic
    @Column(name = "img1")
    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    @Basic
    @Column(name = "img2")
    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    @Basic
    @Column(name = "img3")
    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    @Basic
    @Column(name = "date")
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "video")
    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    @Basic
    @Column(name = "relevant")
    public Integer getRelevant() {
        return relevant;
    }

    public void setRelevant(Integer relevant) {
        this.relevant = relevant;
    }

    @Basic
    @Column(name = "inside")
    public String getInside() {
        return inside;
    }

    public void setInside(String inside) {
        this.inside = inside;
    }

    @Basic
    @Column(name = "kind")
    public Integer getKind() {
        return kind;
    }

    public void setKind(Integer kind) {
        this.kind = kind;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PassageEntity that = (PassageEntity) o;

        if (id != that.id) return false;
        if (type != that.type) return false;
        if (author != that.author) return false;
        if (see != that.see) return false;
        if (like != that.like) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (img1 != null ? !img1.equals(that.img1) : that.img1 != null) return false;
        if (img2 != null ? !img2.equals(that.img2) : that.img2 != null) return false;
        if (img3 != null ? !img3.equals(that.img3) : that.img3 != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (video != null ? !video.equals(that.video) : that.video != null) return false;
        if (relevant != null ? !relevant.equals(that.relevant) : that.relevant != null) return false;
        if (inside != null ? !inside.equals(that.inside) : that.inside != null) return false;
        if (kind != null ? !kind.equals(that.kind) : that.kind != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + type;
        result = 31 * result + author;
        result = 31 * result + see;
        result = 31 * result + like;
        result = 31 * result + (img1 != null ? img1.hashCode() : 0);
        result = 31 * result + (img2 != null ? img2.hashCode() : 0);
        result = 31 * result + (img3 != null ? img3.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (video != null ? video.hashCode() : 0);
        result = 31 * result + (relevant != null ? relevant.hashCode() : 0);
        result = 31 * result + (inside != null ? inside.hashCode() : 0);
        result = 31 * result + (kind != null ? kind.hashCode() : 0);
        return result;
    }
}
