package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Portfolio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PortfolioRepository extends JpaRepository<Portfolio, Integer> {

    // JPQL query to fetch Portfolio by studentId
    @Query("SELECT p FROM Portfolio p WHERE p.student.id = :studentId")
    Portfolio findPortfolioByStudentId(int studentId);
    
//    @Query("SELECT p FROM Portfolio p WHERE p.mentor = :mentor")
//	public List<Portfolio> findByMentor(Mentor mentor);
}
