package com.klef.jfsd.springboot.controller;

import com.klef.jfsd.springboot.model.*;
import com.klef.jfsd.springboot.repository.MentorRepository;
import com.klef.jfsd.springboot.service.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PortfolioController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private PortfolioService portfolioService;

    @Autowired
    private AchievementService achievementService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private PersonalInformationService personalInformationService;

    @Autowired
    private ProjectPortfolioService projectPortfolioService;

    @Autowired
    private SkillsService skillsService;
    
    @Autowired
    private MentorRepository mentorRepository;

    @GetMapping("/addportfolio")
    public ModelAndView showAddPortfolioPage() {
        ModelAndView mv = new ModelAndView("addportfolio");
        List<Mentor> mentors = mentorRepository.findAll(); // Fetch all mentors
        mv.addObject("mentors", mentors);
        return mv;
    }


    @PostMapping("/addportfolio")
    public ModelAndView addPortfolio(
            @RequestParam("studentId") int studentId,
            @RequestParam("mentorId") int mentorId,
            @RequestParam("achievementType") String achievementType,
            @RequestParam("achievementTitle") String achievementTitle,
            @RequestParam("achievementDescription") String achievementDescription,
            @RequestParam("articleTitle") String articleTitle,
            @RequestParam("publicationDate") String publicationDate,
            @RequestParam("articleLink") String articleLink,
            @RequestParam("fullName") String fullName,
            @RequestParam("dateOfBirth") String dateOfBirth,
            @RequestParam("gender") String gender,
            @RequestParam("contactNumber") String contactNumber,
            @RequestParam("emailAddress") String emailAddress,
            @RequestParam("skillType") String skillType,
            @RequestParam("skillName") String skillName,
            @RequestParam("proficiencyLevel") String proficiencyLevel,
            @RequestParam("projectTitle") String projectTitle,
            @RequestParam("projectDescription") String projectDescription,
            @RequestParam("technologiesUsed") String technologiesUsed,
            @RequestParam("duration") String duration,
            @RequestParam("projectLink") String projectLink) {

        ModelAndView mv = new ModelAndView("addportfolio");

        try {
            // Fetch Student entity by ID
            Student student = studentService.displayStudentByID(studentId);
            Mentor mentor = mentorRepository.findById(mentorId).orElse(null);
            
            if (student == null || mentor == null) {
                //mv.addObject("message", "Student with ID " + studentId + " not found.");
            	 mv.addObject("message", "Student or Mentor not found.");
                return mv;
            }

            // Check if the student already has a portfolio
            Portfolio existingPortfolio = portfolioService.getPortfolioByStudentId(studentId);
            if (existingPortfolio != null) {
                mv.addObject("message", "Portfolio already exists for this student.");
                return mv;
            }

            // Create Portfolio object (No title and description in Portfolio)
            Portfolio portfolio = new Portfolio();
            portfolio.setStudent(student);

            // Create and associate Achievement
            Achievement achievement = new Achievement();
            achievement.setType(achievementType);
            achievement.setTitle(achievementTitle);
            achievement.setDescription(achievementDescription);
            achievement.setPortfolio(portfolio);

            // Create and associate Article
            Article article = new Article();
            article.setTitle(articleTitle);
            article.setPublicationDate(publicationDate);
            article.setArticleLink(articleLink);
            article.setPortfolio(portfolio);

            // Create and associate Personal Information
            PersonalInformation personalInformation = new PersonalInformation();
            personalInformation.setFullName(fullName);
            personalInformation.setDateOfBirth(dateOfBirth);
            personalInformation.setGender(gender);
            personalInformation.setContactNumber(contactNumber);
            personalInformation.setEmailAddress(emailAddress);
            personalInformation.setPortfolio(portfolio);

            // Create and associate Skills
            Skills skill = new Skills();
            skill.setSkillType(skillType);  // Corrected field name
            skill.setSkillName(skillName);  // Corrected field name
            skill.setProficiencyLevel(proficiencyLevel);  // Corrected field name
            skill.setPortfolio(portfolio);

            // Create and associate Project Portfolio
            ProjectPortfolio projectPortfolio = new ProjectPortfolio();
            projectPortfolio.setTitle(projectTitle);  // Corrected field name
            projectPortfolio.setDescription(projectDescription);  // Corrected field name
            projectPortfolio.setTechnologiesUsed(technologiesUsed);  // Corrected field name
            projectPortfolio.setDuration(duration);  // Corrected field name
            projectPortfolio.setProjectLink(projectLink);  // Corrected field name
            projectPortfolio.setPortfolio(portfolio);

            // Save Portfolio and associated entities
            portfolioService.savePortfolio(portfolio);
            achievementService.saveAchievement(achievement);
            articleService.saveArticle(article);
            personalInformationService.savePersonalInformation(personalInformation);
            skillsService.saveSkills(skill);
            projectPortfolioService.saveProjectPortfolio(projectPortfolio);

            mv.addObject("message", "Portfolio created successfully!");
        } catch (Exception e) {
            mv.addObject("message", "An error occurred: " + e.getMessage());
        }

        return mv;
    }
    
    @GetMapping("/updateportfolio")
    public ModelAndView showUpdatePortfolioPage(@RequestParam("studentId") int studentId) {
        ModelAndView mv = new ModelAndView("updateportfolio");

        try {
            // Fetch portfolio by student ID
            Portfolio portfolio = portfolioService.getPortfolioByStudentId(studentId);
            if (portfolio == null) {
                mv.setViewName("error");
                mv.addObject("message", "Portfolio not found for the given student ID.");
                return mv;
            }

            mv.addObject("portfolio", portfolio);
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "Error loading portfolio: " + e.getMessage());
        }

        return mv;
    }

    // Handle update portfolio form submission
    @PostMapping("/updateportfolio")
    public ModelAndView updatePortfolio(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("updateportfolio");

        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String achievementType = request.getParameter("achievementType");
            String achievementTitle = request.getParameter("achievementTitle");
            String achievementDescription = request.getParameter("achievementDescription");
            String articleTitle = request.getParameter("articleTitle");
            String publicationDate = request.getParameter("publicationDate");
            String articleLink = request.getParameter("articleLink");
            String fullName = request.getParameter("fullName");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String contactNumber = request.getParameter("contactNumber");
            String emailAddress = request.getParameter("emailAddress");
            String skillType = request.getParameter("skillType");
            String skillName = request.getParameter("skillName");
            String proficiencyLevel = request.getParameter("proficiencyLevel");
            String projectTitle = request.getParameter("projectTitle");
            String projectDescription = request.getParameter("projectDescription");
            String technologiesUsed = request.getParameter("technologiesUsed");
            String duration = request.getParameter("duration");
            String projectLink = request.getParameter("projectLink");

            // Fetch the existing portfolio
            Portfolio portfolio = portfolioService.getPortfolioByStudentId(studentId);
            if (portfolio == null) {
                mv.setViewName("error");
                mv.addObject("message", "Portfolio not found for the given student ID.");
                return mv;
            }

            // Update associated entities
            Achievement achievement = portfolio.getAchievements().get(0); // Assuming 1 achievement
            achievement.setType(achievementType);
            achievement.setTitle(achievementTitle);
            achievement.setDescription(achievementDescription);
            achievementService.saveAchievement(achievement);

            Article article = portfolio.getArticles().get(0); // Assuming 1 article
            article.setTitle(articleTitle);
            article.setPublicationDate(publicationDate);
            article.setArticleLink(articleLink);
            articleService.saveArticle(article);

            PersonalInformation personalInformation = portfolio.getPersonalInformation();
            personalInformation.setFullName(fullName);
            personalInformation.setDateOfBirth(dateOfBirth);
            personalInformation.setGender(gender);
            personalInformation.setContactNumber(contactNumber);
            personalInformation.setEmailAddress(emailAddress);
            personalInformationService.savePersonalInformation(personalInformation);

            Skills skill = portfolio.getSkills().get(0); // Assuming 1 skill
            skill.setSkillType(skillType);
            skill.setSkillName(skillName);
            skill.setProficiencyLevel(proficiencyLevel);
            skillsService.saveSkills(skill);

            ProjectPortfolio projectPortfolio = portfolio.getProjectPortfolios().get(0); // Assuming 1 project
            projectPortfolio.setTitle(projectTitle);
            projectPortfolio.setDescription(projectDescription);
            projectPortfolio.setTechnologiesUsed(technologiesUsed);
            projectPortfolio.setDuration(duration);
            projectPortfolio.setProjectLink(projectLink);
            projectPortfolioService.saveProjectPortfolio(projectPortfolio);

            mv.addObject("message", "Portfolio updated successfully!");
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "An error occurred: " + e.getMessage());
        }

        return mv;
    }
    
    @GetMapping("/viewportfolio")
    public ModelAndView viewPortfolio(HttpServletRequest request, @RequestParam("studentId") int studentId) {
        ModelAndView mv = new ModelAndView("viewportfolio");

        HttpSession session = request.getSession(false);
        if (session == null) {
            mv.setViewName("studentlogin");
            return mv;
        }

        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            mv.setViewName("studentlogin");
            return mv;
        }

        try {
            // Fetch portfolio by student ID
            Portfolio portfolio = portfolioService.getPortfolioByStudentId(studentId);
            if (portfolio == null) {
                mv.setViewName("error");
                mv.addObject("message", "Portfolio not found for this student.");
                return mv;
            }

            mv.addObject("portfolio", portfolio);
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "Error loading portfolio: " + e.getMessage());
        }

        return mv;
    }
    
    @GetMapping("/viewportfoliobyfaculty")
    public ModelAndView viewPortfoliobyfaculty(HttpServletRequest request, @RequestParam("studentId") int studentId) {
        ModelAndView mv = new ModelAndView("viewportfoliobyfaculty");

        System.out.println(studentId);
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

        try {
            // Fetch portfolio by student ID
            Portfolio portfolio = portfolioService.getPortfolioByStudentId(studentId);
            if (portfolio == null) {
                mv.setViewName("error");
                mv.addObject("message", "Portfolio not found for this student.");
                return mv;
            }

            mv.addObject("portfolio", portfolio);
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "Error loading portfolio: " + e.getMessage());
        }

        return mv;
    }
    
//    @GetMapping("/mentorviewportfolio")
//    public ModelAndView mentorViewPortfolio(HttpServletRequest request) {
//        ModelAndView mv = new ModelAndView("mentorviewportfolio");
//
//        // Validate mentor session
//        HttpSession session = request.getSession(false);
//        if (session == null) {
//            mv.setViewName("mentorlogin");
//            return mv;
//        }
//
//        Mentor mentor = (Mentor) session.getAttribute("mentor");
//        if (mentor == null) {
//            mv.setViewName("mentorlogin");
//            return mv;
//        }
//
//        try {
//            // Fetch all students assigned to the mentor
//            List<Student> students = studentService.getStudentsByMentor(mentor);
//
//            if (students.isEmpty()) {
//                mv.addObject("message", "No students assigned to you.");
//                mv.setViewName("mentorviewportfolio");
//                return mv;
//            }
//
//            // List to hold portfolios of students assigned to the mentor
//            List<Portfolio> portfolios = new ArrayList<>();
//            
//            // Loop through each student and fetch their portfolio
//            for (Student student : students) {
//                Portfolio portfolio = portfolioService.getPortfolioByStudentId(student.getId());
//                if (portfolio != null) {
//                    portfolios.add(portfolio);
//                }
//            }
//
//            // Check if there are portfolios available
//            if (portfolios.isEmpty()) {
//                mv.addObject("message", "No portfolios found for your assigned students.");
//            } else {
//                mv.addObject("portfolios", portfolios);
//            }
//
//            // Pass the mentor's name to the view
//            mv.addObject("mentorName", mentor.getName());
//            mv.setViewName("mentorviewportfolio");
//        } catch (Exception e) {
//            mv.setViewName("error");
//            mv.addObject("message", "An error occurred while loading portfolios: " + e.getMessage());
//        }
//
//        return mv;
//    }


//    @GetMapping("/menterviewportfolios")
//    public ModelAndView viewPortfolios(HttpServletRequest request) {
//        ModelAndView mv = new ModelAndView();
//        HttpSession session = request.getSession(false);
//        if (session == null) {
//            mv.setViewName("mentorlogin");
//            return mv;
//        }
//        Mentor mentor = (Mentor) session.getAttribute("mentor");
//        if (mentor == null) {
//            mv.setViewName("mentorlogin");
//            return mv;
//        }
//        List<Portfolio> portfolios = portfolioService.getPortfoliosByMentor(mentor);
//        mv.addObject("portfolioslist", portfolios);
//        mv.setViewName("menterviewportfolios");
//        return mv;
//    }


    
}
