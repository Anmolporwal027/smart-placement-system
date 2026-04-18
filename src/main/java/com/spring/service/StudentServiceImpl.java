package com.spring.service;
import com.spring.dao.StudentDAO;
import com.spring.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired private StudentDAO dao;
    public void register(Student s) {
    	dao.save(s);
    }
    public Student login(String email, String pass) {
        Student s = dao.findByEmail(email);
        return (s != null && s.getPassword().equals(pass)) ? s : null;
    }
    public void updateProfile(Student s) { dao.save(s); }
    public List<Student> getAll() { return dao.findAll(); }
    @Override
    public Student getById(int id) {
        return dao.getById(id); // Calls the DAO
    }
}