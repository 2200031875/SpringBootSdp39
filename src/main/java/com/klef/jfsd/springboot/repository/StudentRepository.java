package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

import java.util.List;


@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{
  @Query("select s from Student s where s.email=?1 and s.password=?2 ") 
   public Student checkstudentlogin(String email, String pwd);

//  @Query("SELECT s FROM Student s WHERE s.mentor = :mentor")
//public List<Student> findByMentor(Mentor mentor);
  
  
  
}