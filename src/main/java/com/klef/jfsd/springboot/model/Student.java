package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="student_table")
public class Student 
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)  
   @Column(name="student_id")
   private int id;
   @Column(name="student_name",nullable=false,length = 50)
   private String name;
   @Column(name="student_gender",nullable=false,length = 20)
   private String gender;
   @Column(name="student_dob",nullable=false,length = 20)
   private String dateofbirth;
   @Column(name="student_program",nullable=false,length = 50)
   private String program;
   @Column(name="student_department",nullable=false,length = 50)
   private String department;
   @Column(name="student_email",nullable=false,unique = true,length = 50)
   private String email;
   @Column(name="student_password",nullable=false,length = 50)
   private String password;
   @Column(name="student_location",nullable=false,length = 50)
   private String location;
   @Column(name="student_contact",nullable=false,unique = true,length = 20)
   private String contact;
   
   @OneToMany(mappedBy = "student", cascade = CascadeType.ALL)
   private List<Project> projects;
   
	/*
	 * @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval =
	 * true) private List<Feedback> feedbackList; // One student can have many
	 * feedbacks
	 */
  
   
public int getId() {
  return id;
}
public void setId(int id) {
  this.id = id;
}
public String getName() {
  return name;
}
public void setName(String name) {
  this.name = name;
}
public String getGender() {
  return gender;
}
public void setGender(String gender) {
  this.gender = gender;
}
public String getDateofbirth() {
  return dateofbirth;
}
public void setDateofbirth(String dateofbirth) {
  this.dateofbirth = dateofbirth;
}
public String getProgram() {
    return program;
  }
  public void setProgram(String program) {
    this.program = program;
  }
public String getDepartment() {
  return department;
}
public void setDepartment(String department) {
  this.department = department;
}
public String getEmail() {
  return email;
}
public void setEmail(String email) {
  this.email = email;
}
public String getPassword() {
  return password;
}
public void setPassword(String password) {
  this.password = password;
}
public String getLocation() {
  return location;
}
public void setLocation(String location) {
  this.location = location;
}
public String getContact() {
  return contact;
}
public void setContact(String contact) {
  this.contact = contact;
}
public List<Project> getProjects() {
  return projects;
}
public void setProjects(List<Project> projects) {
  this.projects = projects;
}



}