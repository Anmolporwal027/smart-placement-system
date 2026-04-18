package com.spring.service;

import com.spring.entity.Student;
import java.util.List;

public interface StudentService {
	public void register(Student s);
    public Student login(String email, String pass);
    public void updateProfile(Student s);
	public List<Student> getAll();
	Student getById(int id);
}