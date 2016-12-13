package com.ssi.drugstore.model;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "manufacturer_id")
    private Manufacturer manufacturer;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "medicine_id")
    private Set<Series> series = new HashSet<Series>();

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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {

        this.category = category;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    public Set<Series> getSeries() {
        return series;
    }

    public void setSeries(Set<Series> series) {
        this.series = series;
    }

    /* Static */

    public static Medicine getForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Medicine medicine;

        try {

            transaction = session.beginTransaction();
            medicine = (Medicine) session.get(Medicine.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return medicine;
    }

    public static List all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List<Medicine> medicines = new ArrayList();

        try {

            transaction = session.beginTransaction();
            medicines = session.createQuery("from Medicine").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return medicines;
    }
}
