package com.ssi.drugstore.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Entity
@Table(name = "user")
public class User {

    private int id;

    @NotNull(message = "Nazwa użytkownika nie może być pusta")
    private String username;

    @NotNull(message = "Hasło nie może być puste")
    private String password;

    @NotNull(message = "Potwierdzenie hasła nie może być puste")
    private String passwordConfirm;

    @NotNull(message = "Rola nie może być pusta")
    private String role;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
