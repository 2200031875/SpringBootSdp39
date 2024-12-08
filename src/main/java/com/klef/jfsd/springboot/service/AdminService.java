package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;


public interface AdminService 
{
	public List<Mentor> viewallmentors();
	 public Admin checkadminlogin(String uname, String pwd);
	public String deletementor(int mid);
	public Mentor displaymentorbyId(int mid);
	public long mentorcount();
	public  List<Project> viewProjectsByStudent(Student s);
}
