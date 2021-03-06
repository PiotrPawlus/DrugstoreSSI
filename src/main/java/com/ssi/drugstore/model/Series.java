package com.ssi.drugstore.model;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.management.*;
import javax.persistence.*;
import javax.persistence.Query;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.*;

/**
 * Created by piotrpawlus on 13/12/2016.
 */
@Entity
@Table(name = "series")
public class Series {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "manufactured_at")
    @NotNull(message = "Data produkcji nie może być pusta")
    private Date manufacturedAt;

    @Column(name = "end_at")
    @NotNull(message = "Data ważności nie może być pusta")
    private Date endAt;

    @Column(name = "serial_number")
    @NotNull(message = "Numer syeryjny nie może być pusty")
    private String serialNumber;

    @Column(name = "amount")
    @NotNull(message = "Ilość nie może być pusta")
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

}
