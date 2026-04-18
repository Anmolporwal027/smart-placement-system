package com.spring.dao;
import com.spring.entity.StudentCompanyStatus;
import java.util.List;
public interface StatusDAO { 
	void saveOrUpdate(StudentCompanyStatus scs);
	List<StudentCompanyStatus> getByStudent(int sid);
	StudentCompanyStatus getByStudentAndCompany(int sid, int cid); 
	List<StudentCompanyStatus> getShortlistedByCompany(int cid);
}