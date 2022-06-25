package com.siushop.model;

import com.siushop.utils.Database;

import java.sql.*;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String dateOfBirth;
    private  boolean isAdmin;

    public User(){}

    public User(int id, String name, String email, String password, String dateOfBirth, boolean isAdmin) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
        this.isAdmin = isAdmin;
    }

    public User(String name, String email, String password, String dateOfBirth) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
    }


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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", isAdmin=" + isAdmin +
                '}';
    }
}
