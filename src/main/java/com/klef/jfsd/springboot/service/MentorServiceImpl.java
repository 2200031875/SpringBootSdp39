package com.klef.jfsd.springboot.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.MentorRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class MentorServiceImpl implements MentorService
{
	@Autowired 
	private StudentRepository studentRepository;
	
	@Autowired
	private MentorRepository mentorRepository;
	
	
	@Override
	public List<Student> ViewAllStudents() 
	{
		return studentRepository.findAll();
	}

	@Override
	public String deletestudent(int sid) 
	{
		studentRepository.deleteById(sid);
		return "Student Deleted Successfuly";
	}

	@Override
	public Student displaystudentbyId(int sid) 
	{
		return studentRepository.findById(sid).get();
	}

	@Override
	public long studentcount() 
	{
		return studentRepository.count();
	}

	@Override
	public Mentor checkmentorlogin(String memail, String mpwd) {
		return mentorRepository.checkmentorlogin(memail,mpwd); 
	}

	@Override
	public String MentorReg(Mentor m) {
		mentorRepository.save(m);
	     return "Mentor Registered Successfully"; 
	}
	@Override
	public Mentor displayMentorByID(int mid) 
	{
		return mentorRepository.findById(mid).get();
	}
	@Override
	public String UpdateMentorProfile(Mentor mentor) 
	{
		Mentor m = mentorRepository.findById(mentor.getId()).get();
	    
		m.setDateofbirth(mentor.getDateofbirth());
m.setContact(mentor.getContact());
m.setDepartment(mentor.getDepartment());
m.setDesignation(mentor.getDesignation());
m.setPassword(mentor.getPassword());
m.setName(mentor.getName());

	    mentorRepository.save(m);
	    
	    return "Mentor Updated Successfully";
	}
	
	
}
