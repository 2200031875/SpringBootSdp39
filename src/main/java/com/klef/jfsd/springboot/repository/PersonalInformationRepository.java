package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.PersonalInformation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonalInformationRepository extends JpaRepository<PersonalInformation, Integer> {
}
