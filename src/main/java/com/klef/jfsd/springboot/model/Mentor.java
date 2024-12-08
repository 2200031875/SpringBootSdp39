package com.klef.jfsd.springboot.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="mentor_table")
public class Mentor 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY) 
  private int id;
  
  @Column(nullable = false)
  private String name;
  
  @Column(nullable=false)
  private String gender;
  
  @Column(nullable=false)
  private String dateofbirth;
  
  @Column(nullable = false)
  private String department;
  
  @Column(nullable = false)
  private String designation;
  
  @Column(nullable=false)
  private String qualification;
  
  @Column(nullable=false,unique = true,length = 50)
  private String email;
  
  @Column(nullable=false,length = 50)
  private String password;
  
  @Column(nullable = false,unique = true)
  private String contact;

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

public String getDepartment() {
  return department;
}

public void setDepartment(String department) {
  this.department = department;
}

public String getDesignation() {
  return designation;
}

public void setDesignation(String designation) {
  this.designation = designation;
}

public String getContact() {
  return contact;
}

public void setContact(String contact) {
  this.contact = contact;
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

public String getQualification() {
  return qualification;
}

public void setQualification(String qualification) {
  this.qualification = qualification;
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

}