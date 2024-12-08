package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.PersonalInformation;
import com.klef.jfsd.springboot.repository.PersonalInformationRepository;
import com.klef.jfsd.springboot.service.PersonalInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonalInformationServiceImpl implements PersonalInformationService {

    @Autowired
    private PersonalInformationRepository personalInformationRepository;

    @Override
    public void savePersonalInformation(PersonalInformation personalInformation) {
        personalInformationRepository.save(personalInformation);
    }
}
