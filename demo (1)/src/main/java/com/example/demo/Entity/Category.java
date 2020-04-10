package com.example.demo.Entity;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
public class Category {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "title")
    @Size(min = 5, max = 20)
    private String title;

    public Category(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public Category() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
