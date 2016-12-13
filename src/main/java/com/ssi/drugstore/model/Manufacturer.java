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
 * Created by piotrpawlus on 13/12/2016.
 */
@Entity
@Table(name = "manufacturer")
public class Manufacturer {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator="manufacturer_id_seq")
    @SequenceGenerator(name = "manufacturer_id_seq", sequenceName = "manufacturer_id_seq", initialValue = 1, allocationSize = 1)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "web")
    private String web;

    @Column(name = "mail")
    private String mail;

    @Column(name = "phone")
    private String phone;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "manufacturer_id")
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

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<Medicine> getMedicines() {
        return medicines;
    }

    public void setMedicines(Set<Medicine> medicines) {
        this.medicines = medicines;
    }

    /* Static */

    public static Manufacturer getForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Manufacturer manufacturer;

        try {

            transaction = session.beginTransaction();
            manufacturer = (Manufacturer) session.get(Manufacturer.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return manufacturer;
    }

    public static List all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List<Manufacturer> manufacturers = new ArrayList();

        try {

            transaction = session.beginTransaction();
            manufacturers = session.createQuery("from Manufacturer").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return manufacturers;
    }
}