package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {

	//void save(Feedback feedback);

	@Query("SELECT f FROM Feedback f WHERE f.project.id = :projectId")
	Feedback findByProjectId(int projectId);

}
