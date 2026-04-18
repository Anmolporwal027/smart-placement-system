package com.spring.service;
import com.spring.entity.Student;
import com.spring.entity.Company;

public interface AIService {
    String getAiInsight(Student s, Company c, String poDecision);
}