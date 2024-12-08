package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.MentorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MentorService mentorService;
	
	@GetMapping("adminhome") 
    public ModelAndView adminhome() 
    { 
      ModelAndView mv = new ModelAndView(); 
      mv.setViewName("adminhome"); 
      
      long count = adminService.mentorcount();
      mv.addObject("count",count);
      
      return mv; 
    } 
	
	@GetMapping("adminlogin")
    public ModelAndView adminlogin()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("adminlogin");
      return mv;
    }
	@GetMapping("mentorreg")
  public ModelAndView mentorreg()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("mentorreg");
    return mv;
  }
	 
	 @PostMapping("mentorregistration")
     public ModelAndView mentorregistration(HttpServletRequest request)
     {
		 String name = request.getParameter("mname");
		 String gender = request.getParameter("mgender");
	      String dob = request.getParameter("mdob");
		 String department = request.getParameter("mdept");
		 String designation = request.getParameter("mdesignation");
		 String qualification = request.getParameter("mqualification");
		 String  email = request.getParameter("memail");
		 String password = request.getParameter("mpwd");
		 String contact = request.getParameter("mcontact");

		 
		 Mentor mentor = new Mentor();
		 
		 mentor.setName(name);
		 mentor.setGender(gender);
		 mentor.setDateofbirth(dob);
		 mentor.setDepartment(department);
		 mentor.setDesignation(designation);
		 mentor.setQualification(qualification);
		 mentor.setEmail(email);
	     mentor.setPassword(password);
		 mentor.setContact(contact);
        
        String msg = mentorService.MentorReg(mentor);
        
        ModelAndView mv = new ModelAndView("regsuccess");
        mv.addObject("message", msg);
      
        return mv;
}

	 
     @GetMapping("viewallmentors") 
     public ModelAndView viewallmentors() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Mentor> mentorlist = adminService.viewallmentors(); 
       mv.setViewName("viewallmentors"); 
       mv.addObject("mentorlist",mentorlist); 
       
       long count = adminService.mentorcount();
       mv.addObject("count",count);
       
       return mv; 
     } 
      
     @GetMapping("deletementor") 
     public ModelAndView deletementor() 
     { 
       ModelAndView mv = new ModelAndView(); 
       List<Mentor> mentorlist = adminService.viewallmentors(); 
       mv.setViewName("deletementor"); 
       mv.addObject("mentorlist",mentorlist); 
       return mv; 
     } 
      
     @GetMapping("deletementorredirect") 
     public String deleteoperation(@RequestParam("id") int mid) 
     { 
      adminService.deletementor(mid); 
       
         return "redirect:/deletementor";
     } 
  
    

      
     @PostMapping("checkadminlogin")
  
       public ModelAndView checkadminlogin(HttpServletRequest request)
       {
      	 ModelAndView mv = new ModelAndView();
      	 
      	  String auname = request.getParameter("auname");
      	  String apwd = request.getParameter("apwd");
      	  
      	  Admin admin = adminService.checkadminlogin(auname, apwd);
      	  
      	  if(admin!=null)
      	  { 
      		  mv.setViewName("adminhome");      		  
      		  long count = adminService.mentorcount();
      		  mv.addObject("count", count);
      	  }
      	  else
      	  {
      		  mv.setViewName("adminloginfail");
      		  mv.addObject("message","Login Failed");
      	  }
      	  return mv;
       }
     
     @GetMapping("updatementor")
     public ModelAndView updatementor()
     {
       ModelAndView mv=new ModelAndView();
       mv.setViewName("updatementor");
       return mv; 
     }
     @PostMapping("updatementorprofile")
     public ModelAndView updatementorprofile(HttpServletRequest request)
     {
       ModelAndView mv = new ModelAndView();
       
      try
      {
    	  int id = Integer.parseInt(request.getParameter("mid"));
    	  String name = request.getParameter("mname");
    	  String department = request.getParameter("mdepartment");
    	  String designation = request.getParameter("mdesignation");
    	  String email = request.getParameter("memail");
    	  String password = request.getParameter("mpassword");
    	  String contact = request.getParameter("mcontact");

    	  // Create a new Mentor object and set the details
    	  Mentor mentor = new Mentor();
    	  mentor.setId(id);
    	  mentor.setName(name);
    	  mentor.setDepartment(department);
    	  mentor.setDesignation(designation);
    	  mentor.setEmail(email);
    	  mentor.setPassword(password);
    	  mentor.setContact(contact);

          
          String msg = mentorService.UpdateMentorProfile(mentor);
          
          Mentor m = mentorService.displayMentorByID(id);
          
           HttpSession session = request.getSession();
           session.setAttribute("mentor",m);
         
         
          mv.setViewName("updatementorsuccess");
          mv.addObject("message", msg);
        
      }
      catch(Exception e)
      {
        mv.setViewName("updatementorerror");
        mv.addObject("message", e);
      }
        return mv;
     }
     
     @GetMapping("adminlogout") 
     public ModelAndView adminlogout() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("adminlogin"); 
       return mv; 
     } 
     
     @GetMapping("viewprojects")
	    public ModelAndView viewprojects(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        HttpSession session = request.getSession(false); 
	        Student student = (Student) session.getAttribute("student"); 
	        mv.setViewName("viewprojects");
	        mv.addObject("projectslist", adminService.viewProjectsByStudent(student));
	        return mv;
	    }
}
