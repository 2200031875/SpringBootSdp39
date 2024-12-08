package com.klef.jfsd.springboot.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "portfolio")
public class Portfolio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @OneToOne
    @JoinColumn(name = "student_id", nullable = false, unique = true)
    private Student student;

    @OneToOne(mappedBy = "portfolio", cascade = CascadeType.ALL)
    private PersonalInformation personalInformation;

    @OneToMany(mappedBy = "portfolio", cascade = CascadeType.ALL)
    private List<Achievement> achievements;

    @OneToMany(mappedBy = "portfolio", cascade = CascadeType.ALL)
    private List<Skills> skills;

    @OneToMany(mappedBy = "portfolio", cascade = CascadeType.ALL)
    private List<Article> articles;

    @OneToMany(mappedBy = "portfolio", cascade = CascadeType.ALL)
    private List<ProjectPortfolio> projectPortfolios;

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public PersonalInformation getPersonalInformation() {
        return personalInformation;
    }

    public void setPersonalInformation(PersonalInformation personalInformation) {
        this.personalInformation = personalInformation;
    }

    public List<Achievement> getAchievements() {
        return achievements;
    }

    public void setAchievements(List<Achievement> achievements) {
        this.achievements = achievements;
    }

    public List<Skills> getSkills() {
        return skills;
    }

    public void setSkills(List<Skills> skills) {
        this.skills = skills;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public List<ProjectPortfolio> getProjectPortfolios() {
        return projectPortfolios;
    }

    public void setProjectPortfolios(List<ProjectPortfolio> projectPortfolios) {
        this.projectPortfolios = projectPortfolios;
    }
}
