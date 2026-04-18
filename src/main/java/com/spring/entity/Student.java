package com.spring.entity;
import jakarta.persistence.*;

@Entity
public class Student {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String enrollmentNumber;
    private String name;
    private String email;
    private String password;
    private String degree;
    private String branch;
    private int passoutYear;
    private double cgpa;
    private int backlogs;
    private String skills;
    
    private String resumePath; // Filename (e.g., "my_resume.pdf")

    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] resumeData; // THE ACTUAL FILE DATA STORED IN DB

    // Standard Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getEnrollmentNumber() { return enrollmentNumber; }
    public void setEnrollmentNumber(String enrollmentNumber) { this.enrollmentNumber = enrollmentNumber; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getDegree() { return degree; }
    public void setDegree(String degree) { this.degree = degree; }
    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }
    public int getPassoutYear() { return passoutYear; }
    public void setPassoutYear(int passoutYear) { this.passoutYear = passoutYear; }
    public double getCgpa() { return cgpa; }
    public void setCgpa(double cgpa) { this.cgpa = cgpa; }
    public int getBacklogs() { return backlogs; }
    public void setBacklogs(int backlogs) { this.backlogs = backlogs; }
    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }
    public String getResumePath() { return resumePath; }
    public void setResumePath(String resumePath) { this.resumePath = resumePath; }
    public byte[] getResumeData() { return resumeData; }
    public void setResumeData(byte[] resumeData) { this.resumeData = resumeData; }
}