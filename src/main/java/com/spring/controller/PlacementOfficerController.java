package com.spring.controller;

import com.spring.entity.Company;
import com.spring.entity.Student;
import com.spring.entity.StudentCompanyStatus;
import com.spring.service.PlacementService;
import com.spring.service.StudentService;
import com.spring.service.EligibilityService; // 1. IMPORTANT: Added this import

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/po")
public class PlacementOfficerController {

    @Autowired private PlacementService ps;
    @Autowired private StudentService ss;
    @Autowired private EligibilityService es; 

    @GetMapping("/dashboard")
    public String poDash(Model m) {
        m.addAttribute("isPO", true); 
        m.addAttribute("companies", ps.getAllCompanies());
        return "po-dashboard";
    }

    @GetMapping("/addCompany")
    public String showAddCompanyForm(Model m) {
        m.addAttribute("isPO", true);
        m.addAttribute("company", new Company()); 
        return "add-company"; 
    }

    @PostMapping("/saveCompany")
    public String save(@ModelAttribute("company") Company c) {
        ps.addCompany(c);
        return "redirect:/po/dashboard";
    } 
    
    @GetMapping("/shortlist/{cid}")
    public String shortlist(@PathVariable("cid") int cid, 
                            @RequestParam(value="skill", required=false) String searchSkill, 
                            Model m) {
        Company c = ps.getCompanyById(cid);
        List<Student> all = ss.getAll();
        List<Student> eligible = new ArrayList<>();

        for(Student s : all) {
            if(es.isEligible(s, c)) { 
                if(searchSkill == null || searchSkill.isEmpty() || 
                   s.getSkills().toLowerCase().contains(searchSkill.toLowerCase())) {
                    eligible.add(s);
                }
            }
        }

        m.addAttribute("company", c);
        m.addAttribute("students", eligible);
        m.addAttribute("isPO", true);
        return "shortlist-results";
    }
    
    @PostMapping("/select")
    public String select(@RequestParam("sid") int sid, @RequestParam("cid") int cid) {
        ps.selectForInterview(sid, cid); 
        return "redirect:/po/shortlist/" + cid + "?emailSent=true";
    }
    
    @GetMapping("/viewShortlisted") 
    public String viewAllShortlisted(Model m) {
        List<Company> companies = ps.getAllCompanies();
        
        Map<Integer, List<StudentCompanyStatus>> shortlistedMap = new HashMap<>();
        
        for (Company c : companies) {
            shortlistedMap.put(c.getId(), ps.getShortlistedByCompany(c.getId()));
        }
        
        m.addAttribute("companies", companies);
        m.addAttribute("shortlistedMap", shortlistedMap); 
        m.addAttribute("isPO", true);
        return "po-shortlisted-categories";
    }
    
    
}