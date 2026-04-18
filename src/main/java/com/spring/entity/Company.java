package com.spring.entity;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Company {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String role;
    private double minCgpa;
    private String allowedBranches;
    private int maxBacklogs;
    private String requiredSkills;
    private LocalDate postingDate; // New
    private String targetDegree; // New
    private int targetPassoutYear; // New

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public double getMinCgpa() { return minCgpa; }
    public void setMinCgpa(double minCgpa) { this.minCgpa = minCgpa; }
    public String getAllowedBranches() { return allowedBranches; }
    public void setAllowedBranches(String allowedBranches) { this.allowedBranches = allowedBranches; }
    public int getMaxBacklogs() { return maxBacklogs; }
    public void setMaxBacklogs(int maxBacklogs) { this.maxBacklogs = maxBacklogs; }
    public String getRequiredSkills() { return requiredSkills; }
    public void setRequiredSkills(String requiredSkills) { this.requiredSkills = requiredSkills; }
    public LocalDate getPostingDate() { return postingDate; }
    public void setPostingDate(LocalDate postingDate) { this.postingDate = postingDate; }
    public String getTargetDegree() { return targetDegree; }
    public void setTargetDegree(String targetDegree) { this.targetDegree = targetDegree; }
    public int getTargetPassoutYear() { return targetPassoutYear; }
    public void setTargetPassoutYear(int targetPassoutYear) { this.targetPassoutYear = targetPassoutYear; }
}