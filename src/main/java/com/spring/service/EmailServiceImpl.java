package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendShortlistEmail(String toEmail, String studentName, String companyName, String aiAdvice) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("your-email@gmail.com");
        message.setTo(toEmail);
        message.setSubject("Congratulations! You are Shortlisted for " + companyName);
        
        String body = "Hello " + studentName + ",\n\n" +
                      "Great News! The Placement Officer has reviewed your profile and shortlisted you for " + companyName + ".\n\n" +
                      "--- SMART AI PREP ADVICE ---\n" +
                      aiAdvice + "\n\n" +
                      "Please log in to the portal for further details.\n" +
                      "Best of Luck!\nPlacement Cell";
                      
        message.setText(body);
        
        new Thread(() -> {
            mailSender.send(message);
        }).start();
    }
}