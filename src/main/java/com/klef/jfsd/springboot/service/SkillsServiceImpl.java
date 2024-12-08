package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Skills;
import com.klef.jfsd.springboot.repository.SkillsRepository;
import com.klef.jfsd.springboot.service.SkillsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SkillsServiceImpl implements SkillsService {

    @Autowired
    private SkillsRepository skillsRepository;

    @Override
    public void saveSkills(Skills skills) {
        skillsRepository.save(skills);
    }
}
