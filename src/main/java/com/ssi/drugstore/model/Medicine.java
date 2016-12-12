package com.ssi.drugstore.model;

import javax.persistence.*;

/**
 * Created by piotrpawlus on 12/12/2016.
 */
@Entity
@Table(name = "medicine")
public class Medicine {

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="medicine_id_seq")
    @SequenceGenerator(name = "medicine_id_seq", sequenceName = "medicine_id_seq", initialValue = 1, allocationSize = 1)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private Float price;

    @Column(name = "capacity")
    private int capacity;

    @Column(name = "measure")
    private String measure;

    @Column(name = "description")
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getMeasure() {
        return measure;
    }

    public void setMeasure(String measure) {
        this.measure = measure;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Medicine [id =" + id + ", name = " + name + ", price = " + price +
                ", capacity = " + capacity + ", measure = " + measure + "]\n";
    }
}
