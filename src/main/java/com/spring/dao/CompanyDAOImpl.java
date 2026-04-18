package com.spring.dao;
import com.spring.entity.Company;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public class CompanyDAOImpl implements CompanyDAO {
    @Autowired private SessionFactory sf;
    public void save(Company c) {
    	sf.getCurrentSession().save(c); 
    }
    public List<Company> findAll() { 
    	return sf.getCurrentSession().createQuery("from Company", Company.class).list(); 
    }
    public Company getById(int id) {
    	return sf.getCurrentSession().get(Company.class, id);
    }
}