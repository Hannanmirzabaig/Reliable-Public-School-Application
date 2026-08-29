package com.reliable.school.model;

import java.sql.Date;

public class Fee {
private int id;
private int studentId;
private double amount;
private Date paymentDate;
private String status;
private String studentName;
private String fatherName;
private String className;
private String reason;


public Fee() {
}


public Fee(int id, int studentId, double amount, Date paymentDate,
           String status, String studentName, String fatherName,
           String className, String reason) {

    this.id = id;
    this.studentId = studentId;
    this.amount = amount;
    this.paymentDate = paymentDate;
    this.status = status;
    this.studentName = studentName;
    this.fatherName = fatherName;
    this.className = className;
    this.reason = reason;
}


public int getId() {
    return id;
}

public void setId(int id) {
    this.id = id;
}


public int getStudentId() {
    return studentId;
}

public void setStudentId(int studentId) {
    this.studentId = studentId;
}


public double getAmount() {
    return amount;
}

public void setAmount(double amount) {
    this.amount = amount;
}


public Date getPaymentDate() {
    return paymentDate;
}

public void setPaymentDate(Date paymentDate) {
    this.paymentDate = paymentDate;
}


public String getStatus() {
    return status;
}

public void setStatus(String status) {
    this.status = status;
}


public String getStudentName() {
    return studentName;
}

public void setStudentName(String studentName) {
    this.studentName = studentName;
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


public String getReason() {
    return reason;
}

public void setReason(String reason) {
    this.reason = reason;
}

}
