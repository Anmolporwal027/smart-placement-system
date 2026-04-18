package com.spring.service;

import com.spring.entity.Company;
import com.spring.entity.Student;
import com.spring.entity.StudentCompanyStatus;

public interface EligibilityService {
	public boolean isEligible(Student s, Company c);
	 public String getFeedback(Student s, Company c);
}