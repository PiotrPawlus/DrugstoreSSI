package com.ssi.drugstore.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * Created by Andrzej on 12.12.2016.
 */
@Entity
@Table(name = "profile")
public class Profile {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    @NotNull(message = "Nazwa nie może być pusta")
    private String name;

    @Column(name = "surname")
    @NotNull(message = "Nazwisko nie może być puste")
    private String surname;

    @Column(name = "date_of_birthday")
    @NotNull(message = "Data urodzenia nie może być pusta")
    private Date dateOfBirthday;

    @Column(name = "phone")
    @NotNull(message = "Telefon nie może być pusty")
    private String phone;

    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    @NotNull(message = "User nie może być pusty")
    private User user_id;

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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


    public Date getDateOfBirthday() {
        return dateOfBirthday;
    }

    public void setDateOfBirthday(Date dateOfBirthday) {
        this.dateOfBirthday = dateOfBirthday;
    }



    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
