package com.spring.controller;

import com.spring.entity.Student;
import com.spring.service.StudentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
    
    @Autowired 
    private StudentService studentService;

    @GetMapping("/") 
    public String index() { 
        return "index"; 
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email, 
                        @RequestParam("password") String password, 
                        @RequestParam("role") String role, 
                        HttpSession session) {
        
        if(role.equals("PO") && email.equals("admin@college.com") && password.equals("admin")) {
            return "redirect:/po/dashboard";
        }
        
        // Student login
        Student s = studentService.login(email, password);
        if(s != null) {
            session.setAttribute("user", s);
            return "redirect:/student/dashboard";
        }
        return "redirect:/?error";
    }

    @GetMapping("/register") 
    public String regPage() { 
        return "register"; 
    }

 // Update your doRegister method in HomeController
    @PostMapping("/doRegister") 
    public String register(@ModelAttribute("s") Student s, 
                           @RequestParam("resumeFile") MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
                s.setResumePath(file.getOriginalFilename());
                s.setResumeData(file.getBytes()); // READS FILE CONTENT AS BYTES
            } catch (Exception e) { e.printStackTrace(); }
        }
        studentService.register(s);
        return "redirect:/?registered=true";
    }

    @GetMapping("/logout") 
    public String logout(HttpSession s) { 
        s.invalidate(); 
        return "redirect:/"; 
    }
}