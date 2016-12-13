package com.ssi.drugstore.model;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.management.*;
import javax.persistence.*;
import javax.persistence.Query;
import java.util.*;

/**
 * Created by piotrpawlus on 13/12/2016.
 */
@Entity
@Table(name = "series")
public class Series {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator="series_id_seq")
    @SequenceGenerator(name = "series_id_seq", sequenceName = "series_id_seq", initialValue = 1, allocationSize = 1)
    @Column(name = "id")
    private int id;

    @Column(name = "manufactured_at")
    private Date manufacturedAt;

    @Column(name = "end_at")
    private Date endAt;

    @Column(name = "serial_number")
    private String serialNumber;

    @Column(name = "amount")
    private int amount;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "medicine_id")
    private Medicine medicine;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getManufacturedAt() {
        return manufacturedAt;
    }

    public void setManufacturedAt(Date manufacturedAt) {
        this.manufacturedAt = manufacturedAt;
    }

    public Date getEndAt() {
        return endAt;
    }

    public void setEndAt(Date endAt) {
        this.endAt = endAt;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Medicine getMedicine() {
        return medicine;
    }

    public void setMedicine(Medicine medicine) {
        this.medicine = medicine;
    }

    /* Static */

    public static Series getForIdentifier(String id) {

        Integer identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Series series;

        try {

            transaction = session.beginTransaction();
            series = (Series) session.get(Series.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return series;
    }

    public static List<Series> allForMedicineId(String id) {

        Integer identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List seriesList = new ArrayList();

        try {

            transaction = session.beginTransaction();
            seriesList = session.createQuery("from Series where medicine=" + identifier).list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return seriesList;
    }

    public static List<Series> all() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List seriesList = new ArrayList();

        try {

            transaction = session.beginTransaction();
            seriesList = (List<Series>) session.createQuery("from Series").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return seriesList;
    }
}