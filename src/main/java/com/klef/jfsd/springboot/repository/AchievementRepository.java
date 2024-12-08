package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Achievement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AchievementRepository extends JpaRepository<Achievement, Integer> {
    // JPQL queries for Achievement can be added here if needed
}
