package com.spring.service;
import com.spring.entity.Company;
import com.spring.entity.Student;
import org.springframework.stereotype.Service;

@Service
public class EligibilityServiceImpl implements EligibilityService {
	@Override
	public boolean isEligible(Student s, Company c) {
	    if (s.getCgpa() < c.getMinCgpa()) return false;
	    if (s.getBacklogs() > c.getMaxBacklogs()) return false;

	    String sSkills = s.getSkills().toLowerCase();
	    String cSkills = c.getRequiredSkills().toLowerCase();
	    
	    String[] required = cSkills.split(",");
	    boolean skillMatch = false;
	    for (String skill : required) {
	        if (sSkills.contains(skill.trim())) {
	            skillMatch = true;
	            break;
	        }
	    }
	    return skillMatch;
	}
    public String getFeedback(Student s, Company c) {
        if (s.getCgpa() < c.getMinCgpa()) return "CGPA too low.";
        if (s.getBacklogs() > c.getMaxBacklogs()) return "Too many backlogs.";
        if (!c.getAllowedBranches().toLowerCase().contains(s.getBranch().toLowerCase())) return "Branch mismatch.";
        return "Eligible";
    }
}