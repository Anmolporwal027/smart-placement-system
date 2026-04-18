package com.spring.service;
import com.spring.entity.Student;
import com.spring.entity.Company;

public interface AIFeedbackService {
    String getAiAdvice(Student s, Company c);
}