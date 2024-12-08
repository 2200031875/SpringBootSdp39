package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Feedback;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Portfolio;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.MentorService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession; 
 
@Controller 
public class MentorController  
{ 
  @Autowired 
  private MentorService mentorService; 
 
  @Autowired
  private StudentService studentService;
  
     @GetMapping("mentorlogin") 
     public ModelAndView mentorlogin() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("mentorlogin"); 
       return mv; 
     } 
     
     @GetMapping("viewallstudents") 
     public ModelAndView viewallstudents() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Student> studentlist = mentorService.ViewAllStudents(); 
       mv.setViewName("viewallstudents"); 
       mv.addObject("studentlist",studentlist); 
       System.out.println(studentlist.size());
       
       long count = mentorService.studentcount();
       mv.addObject("count",count);
       
       return mv; 
     } 
      
     @GetMapping("viewmystudents") 
     public ModelAndView viewmystudents() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Student> studentlist = mentorService.ViewAllStudents(); 
       mv.setViewName("viewmystudents"); 
       mv.addObject("studentlist",studentlist); 
       System.out.println(studentlist.size());
       
       long count = mentorService.studentcount();
       mv.addObject("count",count);
       
       return mv; 
     } 
      
   
      
     
     @GetMapping("deletestudent") 
     public ModelAndView deletestudent() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Student> studentlist = mentorService.ViewAllStudents(); 
       mv.setViewName("deletestudent"); 
       mv.addObject("studentlist",studentlist); 
       return mv; 
     } 
      
     @GetMapping("deletestudentredirect") 
     public String deleteoperation(@RequestParam("id") int sid) 
     { 
      mentorService.deletestudent(sid); 
       
         return "redirect:/deletestudent"; //redirect to same path  
     } 
  
     @PostMapping("checkmentorlogin")
     public ModelAndView checkmentorlogin(HttpServletRequest request)
     {
       ModelAndView mv = new ModelAndView();
       
       String memail = request.getParameter("memail");
       String mpwd = request.getParameter("mpwd");
       
	Mentor mentor =  mentorService.checkmentorlogin(memail, mpwd);
       
       if(mentor!=null)
       {
       
         
         HttpSession session = request.getSession();
         session.setAttribute("mentor",mentor);
         mv.setViewName("mentorhome");
       }
       else
       {
         mv.setViewName("mentorlogin");
         mv.addObject("message", "Login Failed");
       } 
         return mv;
     }
      
     @GetMapping("mentorhome") 
     public ModelAndView mentorhome() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("mentorhome"); 
       
       long count = mentorService.studentcount();
       mv.addObject("count",count);
       
       return mv; 
     } 
      
     @GetMapping("mentorlogout") 
     public ModelAndView mentorlogout() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("mentorlogin"); 
       return mv; 
     } 
     
     @GetMapping("adminviewprojects")
     public ModelAndView viewProjects(HttpServletRequest request) {
         ModelAndView mv = new ModelAndView();
         HttpSession session = request.getSession(false);

         if (session == null) {
             mv.setViewName("mentorlogin");
             return mv;
         }

         Mentor mentor = (Mentor) session.getAttribute("mentor");

         if (mentor == null) {
             mv.setViewName("mentorlogin");
             return mv;
         }
         List<Project> projects = studentService.getProjectsByMentor(mentor);

         mv.addObject("projectslist", projects); 
         mv.setViewName("adminviewprojects");

         return mv;
     }

     
     @GetMapping("givefeedback")
     public ModelAndView giveFeedback(HttpServletRequest request, @RequestParam("projectId") int projectId) {
         ModelAndView mv = new ModelAndView();
         HttpSession session = request.getSession(false);
         Mentor mentor = (Mentor) session.getAttribute("mentor");

         if (mentor == null) {
             mv.setViewName("mentorlogin");
             return mv;
         }

         Project project = studentService.getProjectById(projectId);

         if (project == null || project.getMentor().getId() != mentor.getId()) {
             mv.addObject("message", "You are not authorized to give feedback for this project.");
             mv.setViewName("error");
             return mv;
         }

         mv.addObject("project", project);
         mv.setViewName("givefeedback");
         return mv;
     }

     @PostMapping("submitfeedback")
     public ModelAndView submitFeedback(HttpServletRequest request) {
         HttpSession session = request.getSession(false);
         Mentor mentor = (Mentor) session.getAttribute("mentor");

         if (mentor == null) {
             return new ModelAndView("mentorlogin");
         }

         int projectId = Integer.parseInt(request.getParameter("projectId"));
         String remarks = request.getParameter("remarks");
         String grade = request.getParameter("grade");

         Project project = studentService.getProjectById(projectId);

         if (project == null || project.getMentor().getId() != mentor.getId()) {
             return new ModelAndView("error", "message", "Unauthorized access to project feedback.");
         }

         Feedback feedback = new Feedback();
         feedback.setProject(project);
         feedback.setMentor(mentor);
         feedback.setRemarks(remarks);
         feedback.setGrade(grade);

         studentService.saveFeedback(feedback);

         return new ModelAndView("adminviewprojects");
     }
     
		/*
		 * @GetMapping("/mentorviewportfolio") public ModelAndView
		 * viewPortfolio(HttpServletRequest request) { ModelAndView mv = new
		 * ModelAndView(); HttpSession session = request.getSession(false);
		 * 
		 * if (session == null || session.getAttribute("mentor") == null) {
		 * mv.setViewName("mentorlogin"); return mv; }
		 * 
		 * Mentor mentor = (Mentor) session.getAttribute("mentor");
		 * 
		 * try { List<Portfolio> portfolios =
		 * studentService.getPortfolioByMentor(mentor); mv.addObject("portlist",
		 * portfolios); mv.setViewName("mentorviewportfolio"); } catch (Exception e) {
		 * mv.addObject("error", "Unable to fetch portfolios. Please try again.");
		 * mv.setViewName("mentorviewportfolio"); }
		 * 
		 * return mv; }
		 */
     
     @GetMapping("mentorprofile")
     public ModelAndView mentorprofile()
     {
       ModelAndView mv=new ModelAndView();
       mv.setViewName("mentorprofile");
       return mv; 
     }
     
}