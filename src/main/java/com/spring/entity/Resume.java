package com.spring.entity;
import jakarta.persistence.*;
@Entity public class Resume {
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private int id;
	private String filePath; 
}