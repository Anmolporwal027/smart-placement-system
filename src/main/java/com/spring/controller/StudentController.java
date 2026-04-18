package com.spring.controller;

import com.spring.entity.*;
import com.spring.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired private PlacementService ps;
    @Autowired private AIService aiService;
    @Autowired private StudentService ss;

    @Autowired private AIFeedbackService aiFeedbackService; 

    @GetMapping("/dashboard")
    public String dash(HttpSession session, Model m) {
        Student s = (Student) session.getAttribute("user");
        if(s == null) return "redirect:/";

        List<Company> companies = ps.getAllCompanies();
        Map<Integer, String> statusMap = new HashMap<>();
        Map<Integer, String> aiMap = new HashMap<>();
        Map<Integer, String> careerAdviceMap = new HashMap<>(); // NEW MAP
        
        for(Company c : companies) {
            String currentStatus = ps.getStatusForStudent(s.getId(), c.getId());
            statusMap.put(c.getId(), currentStatus);
            aiMap.put(c.getId(), aiService.getAiInsight(s, c, currentStatus));
            
            // CALLING THE NEW SERVICE
            careerAdviceMap.put(c.getId(), aiFeedbackService.getAiAdvice(s, c));
        }

        m.addAttribute("companies", companies);
        m.addAttribute("statusMap", statusMap);
        m.addAttribute("aiMap", aiMap);
        m.addAttribute("adviceMap", careerAdviceMap); // Pass to JSP
        return "student-dashboard";
    }
    
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("oldPassword") String oldPass,
                                 @RequestParam("newPassword") String newPass,
                                 HttpSession session, Model m) {
        Student s = (Student) session.getAttribute("user");
        
        if(s.getPassword().equals(oldPass)) {
            s.setPassword(newPass);
            ss.updateProfile(s);
            session.setAttribute("user", s);
            return "redirect:/student/dashboard?success=passwordChanged";
        } else {
            return "redirect:/student/dashboard?error=wrongOldPassword";
        }
    }
    
    @GetMapping("/viewResume/{sid}")
    public void viewResume(@PathVariable("sid") int sid, jakarta.servlet.http.HttpServletResponse response) {
        try {
            Student s = ss.getById(sid); // Fetch student from DB
            if (s != null && s.getResumeData() != null) {
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline; filename=" + s.getResumePath());
                response.getOutputStream().write(s.getResumeData()); // WRITE BYTES TO RESPONSE
                response.getOutputStream().flush();
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}