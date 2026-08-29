package com.reliable.school.model;

public class Admin {

    private int id;
    private String username;
    private String email;
    private String password;
    private String role;
    private String status;


    // Default Constructor
    public Admin() {

    }


    // Existing Constructor
    public Admin(int id, String username, String password) {

        this.id = id;
        this.username = username;
        this.password = password;
    }


    // Full Constructor
    public Admin(int id, String username, String password,
                 String role, String status) {

        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.status = status;
    }


    // Full Constructor with Email
    public Admin(int id, String username, String email,
                 String password, String role, String status) {

        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
    }


    // ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    // Username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    // Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    // Password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    // Role
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    // Status
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}