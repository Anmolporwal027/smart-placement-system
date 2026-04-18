package com.spring.entity;
import jakarta.persistence.*;

@Entity
public class StudentCompanyStatus {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne private Student student;
    @ManyToOne private Company company;
    private String status; // Pending, Shortlisted, Selected
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Student getStudent() { return student; }
    public void setStudent(Student student) { this.student = student; }
    public Company getCompany() { return company; }
    public void setCompany(Company company) { this.company = company; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}