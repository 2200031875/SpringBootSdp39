package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Achievement;
import com.klef.jfsd.springboot.repository.AchievementRepository;
import com.klef.jfsd.springboot.service.AchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AchievementServiceImpl implements AchievementService {

    @Autowired
    private AchievementRepository achievementRepository;

    @Override
    public void saveAchievement(Achievement achievement) {
        achievementRepository.save(achievement);
    }
}
