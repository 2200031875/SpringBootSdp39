package com.klef.jfsd.springboot.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.MentorRepository;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ProjectController 
{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private MentorRepository mentorRepository;
	
	@GetMapping("uploadproject")
	public ModelAndView uploadproject() {
	    ModelAndView mv = new ModelAndView("uploadproject");
	    List<Mentor> mentors = mentorRepository.findAll(); // Fetch all mentors
	    mv.addObject("mentors", mentors);
	    return mv;
	}
	    
	 @PostMapping("addproject")
	    public ModelAndView addproject(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      HttpSession session = request.getSession(false); 
	      Student student = (Student) session.getAttribute("student"); 
	        if (student == null) {
	            mv.setViewName("studentlogin");
	            return mv; 
	        }
	      String title = request.getParameter("pname");
	      String description = request.getParameter("pdescription");
	      String startDateStr = request.getParameter("startDate");
	      String endDateStr = request.getParameter("endDate");
	      String link = request.getParameter("plink");
	        if (link != null && link.trim().isEmpty()) {
	            link = null;
	        }
	        int mentorId;
	        try {
	            mentorId = Integer.parseInt(request.getParameter("mentorId"));
	        } catch (NumberFormatException e) {
	            mv.addObject("message", "Invalid mentor selected.");
	            mv.setViewName("uploadproject");
	            return mv;
	        }
	        Mentor mentor = mentorRepository.findById(mentorId).orElse(null);
	        if (mentor == null) {
	            mv.addObject("message", "Invalid mentor selected.");
	            mv.setViewName("uploadproject");
	            return mv;
	        }
	        
	        
	        
	        boolean completed = "on".equals(request.getParameter("completed"));
	        
	        Date startDate = Date.valueOf(startDateStr); 
	        Date endDate = Date.valueOf(endDateStr);
	        
	      Project project = new Project();
	      project.setTitle(title);
	     project.setDescription(description);
	     project.setStartDate(startDate);
	     project.setEndDate(endDate);
	      project.setLink(link);
	      project.setStudent(student);
	      project.setMentor(mentor);
	      project.setCompleted(completed);
	      
	      mv.setViewName("uploadproject");
	      String msg = studentService.uploadProject(project);
	        mv.addObject("message", msg);
	        return mv;
	    }
}
