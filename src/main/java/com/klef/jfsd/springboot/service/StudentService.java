package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Feedback;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Portfolio;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;


public interface StudentService
{
  public String AddStudent(Student s); 
  public Student checkstudentlogin(String email, String pwd);
  public Student displayStudentByID(int sid);
  public String UpdateStudentProfile(Student student);
  public String uploadProject(Project project);
  
  public List<Project> getProjectsByMentor(Mentor mentor);
  
  public Project getProjectById(int projectId);

  public String updateProject(Project project);
  
  List<Project> getProjectsForFeedback();

  public Project viewProjectById(int pid);
public String deleteProjectById(int pid);

public void saveFeedback(Feedback feedback);

public Feedback getFeedbackByProjectId(int projectId);

/* public List<Portfolio> getPortfolioByMentor(Mentor mentor); */
//public List<Student> getStudentsByMentor(Mentor mentor);

//public void saveOrUpdatePortfolio(Portfolio portfolio);
//public void updatePortfolio(Portfolio portfolio);
//public boolean isStudentPortfolioExists(Student student);
//public void savePortfolio(Portfolio portfolio);
//public Portfolio getPortfolioByStudentId(int studentId);
//boolean isStudentPortfolioExists(Student student);
//boolean isStudentPortfolioExists(Student student);
//Portfolio getPortfolioByStudentId(int studentId);

}
