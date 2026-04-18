package com.spring.dao;
import com.spring.entity.Company;
import java.util.List;
public interface CompanyDAO {
	void save(Company c); 
	List<Company> findAll(); 
	Company getById(int id); 
}