package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Integer>
{
	List<Project> findByStudentId(Long studentId);

    @Query("SELECT p FROM Project p WHERE p.student = :student")
	List<Project> viewProjectsByStudent(@Param("student") Student s);

    @Query("SELECT p FROM Project p WHERE p.mentor = :mentor")
    List<Project> findProjectsByMentor(@Param("mentor") Mentor mentor);

    @Query("SELECT p FROM Project p WHERE p.completed = true")
	List<Project> findByCompletedTrue();

}
