package com.klef.jfsd.springboot.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.MentorRepository;
import com.klef.jfsd.springboot.repository.ProjectRepository;


@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired 
	private MentorRepository mentorRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Override
	public List<Mentor> viewallmentors() 
	{
		return mentorRepository.findAll();
	}

	@Override
	public Admin checkadminlogin(String uname, String pwd) 
	{
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public String deletementor(int mid) 
	{
		mentorRepository.deleteById(mid);
		return "Student Deleted Successfuly";
	}

	@Override
	public Mentor displaymentorbyId(int mid) 
	{
		return mentorRepository.findById(mid).get();
	}

	@Override
	public long mentorcount() 
	{
		return mentorRepository.count();
	}
	
	@Override
	public List<Project> viewProjectsByStudent(Student s) {
		 return projectRepository.viewProjectsByStudent(s);
	}
}
