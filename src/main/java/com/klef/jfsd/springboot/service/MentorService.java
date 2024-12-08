package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;


public interface MentorService 
{
	public List<Student> ViewAllStudents();
	public String deletestudent(int sid);
	public Student displaystudentbyId(int sid);
	public long studentcount();
	public Mentor checkmentorlogin(String email, String pwd);
	public String MentorReg(Mentor m);
	 public Mentor displayMentorByID(int mid);
	  public String UpdateMentorProfile(Mentor mentor);
}
