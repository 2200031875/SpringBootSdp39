package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.ProjectPortfolio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectPortfolioRepository extends JpaRepository<ProjectPortfolio, Integer> {
}