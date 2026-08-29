
package com.reliable.school.model;

public class Student {

    private int id;
    private String name;
    private String fatherName;
    private String className;
    private String rollNumber;
    private String mobile;
    private String address;

    public Student() {
    }

    public Student(int id, String name, String fatherName,
                   String className, String rollNumber,
                   String mobile, String address) {

        this.id = id;
        this.name = name;
        this.fatherName = fatherName;
        this.className = className;
        this.rollNumber = rollNumber;
        this.mobile = mobile;
        this.address = address;
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

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}