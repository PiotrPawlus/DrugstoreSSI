package com.ssi.drugstore.model;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.*;
import java.util.*;

/**
 * Created by piotrpawlus on 12/12/2016.
 */
@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator="category_id_seq")
    @SequenceGenerator(name = "category_id_seq", sequenceName = "category_id_seq", initialValue = 1, allocationSize = 1)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Set<Medicine> medicines = new HashSet<Medicine>();

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Medicine> getMedicines() {
        return medicines;
    }

    public void setMedicines(Set<Medicine> medicines) {
        this.medicines = medicines;
    }

    public static Category getForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        return getForIdentifier(identifier);
    }

    /* Static */

    public static Category getForIdentifier(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Category category;

        try {

            transaction = session.beginTransaction();
            category = (Category) session.get(Category.class, id);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return category;
    }

    public static List<Category> all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List categories = new ArrayList();

        try {

            transaction = session.beginTransaction();
            categories = (List<Category>) session.createQuery("from Category").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return categories;
    }
}
