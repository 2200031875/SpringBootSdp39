package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "personal_information")
public class PersonalInformation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

//    @OneToOne
//    @JoinColumn(name = "student_id", nullable = false, unique = true)
//    private Student student;
    
    @ManyToOne
    @JoinColumn(name = "portfolio_id")
    private Portfolio portfolio;

    @Column(name = "full_name", nullable = false, length = 100)
    private String fullName;

    @Column(name = "date_of_birth", nullable = false)
    private String dateOfBirth;

    @Column(name = "gender", nullable = false, length = 10)
    private String gender;

//    @Column(name = "nationality", length = 50)
//    private String nationality;

    @Column(name = "contact_number", nullable = false, length = 15)
    private String contactNumber;

    @Column(name = "email_address", nullable = false, unique = true, length = 100)
    private String emailAddress;

//    @Column(name = "profile_picture_url")
//    private String profilePictureUrl;
//
//    @Column(name = "permanent_address", length = 255)
//    private String permanentAddress;
//
//    @Column(name = "linkedin_url", length = 255)
//    private String linkedIn;
//
//    @Column(name = "github_url", length = 255)
//    private String gitHub;

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

//    public Student getStudent() {
//        return student;
//    }
//
//    public void setStudent(Student student) {
//        this.student = student;
//    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

//    public String getNationality() {
//        return nationality;
//    }
//
//    public void setNationality(String nationality) {
//        this.nationality = nationality;
//    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

//    public String getProfilePictureUrl() {
//        return profilePictureUrl;
//    }
//
//    public void setProfilePictureUrl(String profilePictureUrl) {
//        this.profilePictureUrl = profilePictureUrl;
//    }
//
//    public String getPermanentAddress() {
//        return permanentAddress;
//    }
//
//    public void setPermanentAddress(String permanentAddress) {
//        this.permanentAddress = permanentAddress;
//    }
//
//    public String getLinkedIn() {
//        return linkedIn;
//    }
//
//    public void setLinkedIn(String linkedIn) {
//        this.linkedIn = linkedIn;
//    }
//
//    public String getGitHub() {
//        return gitHub;
//    }
//
//    public void setGitHub(String gitHub) {
//        this.gitHub = gitHub;
//    }

	public Portfolio getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(Portfolio portfolio) {
		this.portfolio = portfolio;
	}
}
