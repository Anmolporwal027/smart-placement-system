package com.spring.service;

public interface EmailService {
    void sendShortlistEmail(String toEmail, String studentName, String companyName, String aiAdvice);
}