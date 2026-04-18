package com.spring.service;
import com.spring.dao.*;
import com.spring.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class PlacementServiceImpl implements PlacementService {
    @Autowired private CompanyDAO cdao;
    @Autowired private StatusDAO sdao;
    @Autowired private StudentDAO stdao;
    @Autowired private EmailService emailService; 
    @Autowired private AIFeedbackService aiFeedbackService; 
    
    @Override
    public void addCompany(Company c) {
        c.setPostingDate(java.time.LocalDate.now()); 
        cdao.save(c); 
    }
    
    public List<Company> getAllCompanies() { 
    	return cdao.findAll();
    }
    public Company getCompanyById(int id) { 
    	return cdao.getById(id); 
    }
       
    @Override
    public void selectForInterview(int sid, int cid) {
        // 1. Update Database Status
        Student s = stdao.getById(sid);
        Company c = cdao.getById(cid);
        
        StudentCompanyStatus status = sdao.getByStudentAndCompany(sid, cid);
        if(status == null) {
            status = new StudentCompanyStatus();
            status.setStudent(s);
            status.setCompany(c);
        }
        status.setStatus("Shortlisted"); 
        sdao.saveOrUpdate(status);

        // 2. Fetch AI Advice to include in Email
        String advice = aiFeedbackService.getAiAdvice(s, c);

        // 3. Send the Email
        emailService.sendShortlistEmail(s.getEmail(), s.getName(), c.getName(), advice);
    }
     
    public List<StudentCompanyStatus> getStudentStats(int sid) {
    	return sdao.getByStudent(sid); 
    }
    @Override
    public String getStatusForStudent(int sid, int cid) {
        StudentCompanyStatus scs = sdao.getByStudentAndCompany(sid, cid);
        return (scs != null) ? scs.getStatus() : "Not Evaluated";
    }  
    @Override
    public List<StudentCompanyStatus> getShortlistedByCompany(int cid) {
        return sdao.getShortlistedByCompany(cid); // 'sdao' is your StatusDAO
    }
}