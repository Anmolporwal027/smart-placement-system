package com.spring.dao;
import com.spring.entity.Student;
import java.util.List;
public interface StudentDAO {
    void save(Student s);
    Student findByEmail(String email);
    List<Student> findAll();
    Student getById(int id);
}