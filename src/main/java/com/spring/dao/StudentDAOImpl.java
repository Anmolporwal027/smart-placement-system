package com.spring.dao;
import com.spring.entity.Student;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class StudentDAOImpl implements StudentDAO {
    @Autowired 
    private SessionFactory sf;
    public void save(Student s) { 
    	sf.getCurrentSession().saveOrUpdate(s);
    }
    public Student findByEmail(String email) {
        return sf.getCurrentSession().createQuery("from Student where email=:e", Student.class).setParameter("e", email).uniqueResult();
    }
    public List<Student> findAll() {
    	return sf.getCurrentSession().createQuery("from Student", Student.class).list(); 
    }
    public Student getById(int id) { 
    	return sf.getCurrentSession().get(Student.class, id); 
    }
}