package com.spring.service;

import com.spring.entity.Company;
import com.spring.entity.StudentCompanyStatus;

import java.util.List;

public interface PlacementService {
	public void addCompany(Company c);
    public List<Company> getAllCompanies();
    public Company getCompanyById(int id);
    public void selectForInterview(int sid, int cid) ;
    public List<StudentCompanyStatus> getStudentStats(int sid);
    String getStatusForStudent(int sid, int cid);
    List<StudentCompanyStatus> getShortlistedByCompany(int cid);
}