package com.example.mqtt.Entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "admin", schema = "manager", catalog = "")
public class AdminEntity {
    private int id;
    private String username;
    private String passage;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "passage")
    public String getPassage() {
        return passage;
    }

    public void setPassage(String passage) {
        this.passage = passage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminEntity that = (AdminEntity) o;
        return id == that.id &&
                Objects.equals(username, that.username) &&
                Objects.equals(passage, that.passage);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, passage);
    }
}
