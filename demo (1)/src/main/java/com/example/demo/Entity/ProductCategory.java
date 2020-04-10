/*
package com.example.demo.Entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class ProductCategory {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "category_id", nullable = false, updatable = false)
    @OneToMany(mappedBy = "Category", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Category> category_id;

    @Column(name = "product_id", nullable = false, updatable = false)
    @OneToMany(mappedBy = "Product", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Product> product_id;

    public ProductCategory(int id, Set<Category> category_id, Set<Product> product_id) {
        this.id = id;
        this.category_id = category_id;
        this.product_id = product_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Set<Category> getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Set<Category> category_id) {
        this.category_id = category_id;
    }

    public Set<Product> getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Set<Product> product_id) {
        this.product_id = product_id;
    }
}
*/
