  package com.klef.jfsd.springboot.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Feedback;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Portfolio;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.FeedbackRepository;
import com.klef.jfsd.springboot.repository.PortfolioRepository;
import com.klef.jfsd.springboot.repository.ProjectRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
 @Autowired 
 private StudentRepository studentRepository;
 
 @Autowired
 private ProjectRepository projectRepository;
 
 @Autowired
 private FeedbackRepository feedbackRepository;
 
 @Autowired
 private PortfolioRepository portfolioRepository;
 
 @Override
  
 public String AddStudent(Student s) 
  {  
	 studentRepository.save(s);
     return "Student Added Successfully"; }
 @Override
   public Student checkstudentlogin(String email, String pwd)  
 {
   return studentRepository.checkstudentlogin(email,pwd); 
   }
@Override
public Student displayStudentByID(int sid) 
{
	return studentRepository.findById(sid).get();
}
@Override
public String UpdateStudentProfile(Student student) 
{
	Student s = studentRepository.findById(student.getId()).get();
    
    s.setContact(student.getContact());
    s.setDateofbirth(student.getDateofbirth());
    s.setDepartment(student.getDepartment());
    s.setGender(student.getGender());
    s.setLocation(student.getLocation());
    s.setName(student.getName());
    s.setPassword(student.getPassword());
  
    studentRepository.save(s);
    
    return "Student Updated Successfully";
}

@Override
public String uploadProject(Project project) 
{
  projectRepository.save(project);
  return "Project Uploaded Successfully";
}

@Override
public Project getProjectById(int projectId) {
    return projectRepository.findById(projectId).orElse(null);
}

@Override
public String updateProject(Project project) {
  projectRepository.save(project);
  return "Project Updated Successfully";
}

@Override
public List<Project> getProjectsByMentor(Mentor mentor) {
    return projectRepository.findProjectsByMentor(mentor);
}

@Override
public List<Project> getProjectsForFeedback() {
    return projectRepository.findByCompletedTrue();
}
@Override
public Project viewProjectById(int pid) {
	 return projectRepository.findById(pid).orElse(null);
	
}
@Override
public String deleteProjectById(int pid) {
    Project project = projectRepository.findById(pid).orElse(null);
    if (project == null) {
        throw new RuntimeException("Project not found");
    }

    projectRepository.delete(project);
    return "Project deleted successfully";
}
@Override
public void saveFeedback(Feedback feedback) {
    feedbackRepository.save(feedback);
}

@Override
public Feedback getFeedbackByProjectId(int projectId) {
    return feedbackRepository.findByProjectId(projectId);
}
//@Override
//public void updatePortfolio(Portfolio portfolio) {
//	 portfolioRepository.save(portfolio);
//}
//@Override
//public List<Student> getStudentsByMentor(Mentor mentor) {
//	return studentRepository.findByMentor(mentor);
//}
/*
 * @Override public List<Portfolio> getPortfolioByMentor(Mentor mentor) { return
 * portfolioRepository.findPortfoliosByMentor(mentor); }
 */
//@Override
//public void savePortfolio(Portfolio portfolio) {
//    // Save a new portfolio for the student
//    portfolioRepository.save(portfolio);
//}
//
//@Override
//public Portfolio getPortfolioByStudentId(int studentId) {
//    // Fetch the portfolio for the given student ID
//    return portfolioRepository.findByStudentId(studentId);
//}
//
//@Override
//public boolean isStudentPortfolioExists(Student studentId) {
//    // Check if a portfolio already exists for the given student ID
//    Portfolio portfolio = portfolioRepository.findByStudentId(studentId);
//    return portfolio != null;
//}


	
}

