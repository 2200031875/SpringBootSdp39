package com.klef.jfsd.springboot.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Feedback;
import com.klef.jfsd.springboot.model.PDFGenerator;
import com.klef.jfsd.springboot.model.Portfolio;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.MentorService;
import com.klef.jfsd.springboot.service.PortfolioService;
import com.klef.jfsd.springboot.service.ProjectService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequestMapping("/portfolio")
public class StudentController
{
  @Autowired
  private MentorService mentorService;
  
  @Autowired
  private StudentService studentService;

  @Autowired
  private ProjectService projectService;
  
  @Autowired
  private PortfolioService portfolioService;
  
  @GetMapping("/")
  public ModelAndView home()
  {
    ModelAndView mv= new ModelAndView();
    mv.setViewName("home");
    return mv;
  }
  @GetMapping("addstudent")
  public ModelAndView addstudent()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("addstudent");
    return mv;
  }
  
  @GetMapping("studentlogin")
  public ModelAndView studentlogin()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("studentlogin");
    return mv;
  }
  
  @PostMapping("insertstudent")
     public ModelAndView insertstudent(HttpServletRequest request)
     {
      String name = request.getParameter("sname");
      String gender = request.getParameter("sgender");
      String dob = request.getParameter("sdob");
      String program = request.getParameter("sprogram");
      String dept = request.getParameter("sdept");
      String location = request.getParameter("slocation");
      String email = request.getParameter("semail");
      String password = request.getParameter("spwd");
      String contact = request.getParameter("scontact");
      

      
        Student student = new Student();
        student.setName(name);
        student.setGender(gender);
        student.setProgram(program);
        student.setDepartment(dept);
        student.setDateofbirth(dob);
        student.setLocation(location);
        student.setEmail(email);
        student.setPassword(password);
        student.setContact(contact);
        
        String msg = studentService.AddStudent(student);
        
        ModelAndView mv = new ModelAndView("addsuccess");
        mv.addObject("message", msg);
      
        return mv;
}
  
  @PostMapping("checkstudentlogin")
  public ModelAndView checkstudentlogin(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
    
    String semail = request.getParameter("semail");
    String spwd = request.getParameter("spwd");
    
    Student student =  studentService.checkstudentlogin(semail, spwd);
    
    if(student!=null)
    {
    
      
      HttpSession session = request.getSession();
      session.setAttribute("student",student);
      mv.setViewName("studenthome");
    }
    else
    {
      mv.setViewName("studentloginfail");
      mv.addObject("message", "Login Failed");
    } 
      return mv;
  }
    
  @GetMapping("studenthome")
  public ModelAndView studenthome()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("studenthome");
    return mv; 
  }
  
  @GetMapping("studentprofile")
  public ModelAndView studentprofile()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("studentprofile");
    return mv; 
  }
  
  @GetMapping("studentcontactus")
  public ModelAndView studentcontactus()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("studentcontactus");
    return mv; 
  }
  
  @GetMapping("studentlogout")
  public ModelAndView studentlogout(HttpServletRequest request)  
  {
    HttpSession session = request.getSession();
    
    session.removeAttribute("student");  
    ModelAndView mv=new ModelAndView();
    mv.setViewName("studentlogin");
    return mv; 
  }
  
  @GetMapping("updatestudent")
  public ModelAndView updatestudent()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("updatestudent");
    return mv; 
  }
  @PostMapping("updatestudentprofile")
  public ModelAndView updatestudentprofile(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
    
   try
   {
       int id = Integer.parseInt(request.getParameter("sid"));
       String name = request.getParameter("sname");
     String gender = request.getParameter("sgender");
     String dob = request.getParameter("sdob");
     String dept = request.getParameter("sdept");
     String password = request.getParameter("spwd");
     String location = request.getParameter("slocation");
     String contact = request.getParameter("scontact");
     
       Student student = new Student();
       student.setId(id);
       student.setName(name);
       student.setGender(gender);
       student.setDepartment(dept);
       student.setDateofbirth(dob);
       student.setPassword(password);
       student.setLocation(location);
       student.setContact(contact);
       
       String msg = studentService.UpdateStudentProfile(student);
       
       Student s = studentService.displayStudentByID(id);
       
        HttpSession session = request.getSession();
        session.setAttribute("student",s);
      
      
       mv.setViewName("updatesuccess");
       mv.addObject("message", msg);
     
   }
   catch(Exception e)
   {
     mv.setViewName("updateerror");
     mv.addObject("message", e);
   }
     return mv;
  }
  
  @GetMapping("studentsessionexpiry")
  public ModelAndView studentsessionexpiry()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentsessionexpiry");
    return mv;
  }


  @GetMapping("updateproject")
  public ModelAndView updateProject(@RequestParam("id") int pid) {
      ModelAndView mv = new ModelAndView("updateproject");
      Project project = studentService.viewProjectById(pid);
      mv.addObject("project", project);
      return mv;
  }

  
  @PostMapping("saveupdatedproject")
  public ModelAndView saveUpdatedProject(HttpServletRequest request) {
      ModelAndView mv = new ModelAndView();
      HttpSession session = request.getSession(false);
      Student student = (Student) session.getAttribute("student");

      if (student == null) {
          mv.setViewName("studentlogin");
          return mv;
      }

      String pidParam = request.getParameter("pid");
      if (pidParam == null || pidParam.isEmpty()) {
          mv.setViewName("error");
          mv.addObject("message", "Project ID is missing");
          return mv;
      }

      try {
          int pid = Integer.parseInt(pidParam);
          String title = request.getParameter("pname");
          String description = request.getParameter("pdescription");
          String link = request.getParameter("plink");

          if (link != null && link.trim().isEmpty()) {
              link = null;
          }
          Project project = studentService.viewProjectById(pid);

          if (project == null) {
              mv.setViewName("error");
              mv.addObject("message", "Project not found");
              return mv;
          }

          project.setTitle(title);
          project.setDescription(description);
          project.setLink(link);
          project.setStudent(student);
          String msg = studentService.updateProject(project);
          mv.setViewName("updateproject");
          mv.addObject("message", msg);
         
          mv.addObject("project", project);

      } catch (NumberFormatException e) {
        mv.setViewName("error");
          mv.addObject("message", e);
      }

      return mv;
  }
  
  
  @GetMapping("deleteproject")
  public ModelAndView deleteProject(@RequestParam("id") int pid, HttpServletRequest request) {
      ModelAndView mv = new ModelAndView();
      HttpSession session = request.getSession(false);
      Student student = (Student) session.getAttribute("student");

      // Check if the student is logged in
      if (student == null) {
          mv.setViewName("studentlogin");
          return mv;
      }

      try {
          String msg = studentService.deleteProjectById(pid);  // Service layer method to handle deletion
          mv.setViewName("viewprojects"); // Redirect to the page where projects are listed
          mv.addObject("message", "Project deleted successfully");
          mv.addObject("messageType", "success");
      } catch (Exception e) {
          mv.setViewName("viewprojects");
          mv.addObject("message", "Error deleting project: " + e.getMessage());
          mv.addObject("messageType", "error");
      }

      return mv;
  }

  @GetMapping("viewfeedback")
  public ModelAndView viewFeedback(HttpServletRequest request, @RequestParam("id") int projectId) {
      ModelAndView mv = new ModelAndView();
      HttpSession session = request.getSession(false);
      Student student = (Student) session.getAttribute("student");

      if (student == null) {
          mv.setViewName("studentlogin");
          return mv;
      }

      Project project = studentService.getProjectById(projectId);

      if (project == null || project.getStudent().getId() != student.getId()) {
          mv.addObject("message", "You are not authorized to view this feedback.");
          mv.setViewName("error");
          return mv;
      }

      Feedback feedback = studentService.getFeedbackByProjectId(projectId);

      mv.addObject("project", project);
      mv.addObject("feedback", feedback);
      mv.setViewName("viewfeedback");
      return mv;
  }

  @GetMapping("/downloadportfolio")
  public ResponseEntity<byte[]> downloadPortfolio(HttpServletRequest request, @RequestParam("studentId") int studentId) {
      HttpSession session = request.getSession(false);
      if (session == null || session.getAttribute("student") == null) {
          return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
      }

      try {
          Portfolio portfolio = portfolioService.getPortfolioByStudentId(studentId);
          if (portfolio == null) {
              return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Portfolio not found".getBytes());
          }

          // Generate PDF
          byte[] pdfContent = PDFGenerator.generatePortfolioPDF(portfolio);

          // Return as downloadable file
          return ResponseEntity.ok()
                  .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=portfolio_" + studentId + ".pdf")
                  .contentType(MediaType.APPLICATION_PDF)
                  .body(pdfContent);
      } catch (Exception e) {
          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(("Error generating PDF: " + e.getMessage()).getBytes());
      }
  }


  
}