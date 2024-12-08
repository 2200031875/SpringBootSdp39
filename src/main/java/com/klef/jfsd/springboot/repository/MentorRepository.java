package com.klef.jfsd.springboot.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface MentorRepository extends JpaRepository<Mentor, Integer>
{
  
  
  @Query("delete from Student s where s.contact=?1")
  @Modifying
  @Transactional
  public int deletestudentbyid(String contact);

  @Query("select m from Mentor m where m.email=?1 and m.password=?2 ") 
  public Mentor checkmentorlogin(String email, String pwd);


  
  

  
}