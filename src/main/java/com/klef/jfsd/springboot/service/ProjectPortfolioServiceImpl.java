package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.ProjectPortfolio;
import com.klef.jfsd.springboot.repository.ProjectPortfolioRepository;
import com.klef.jfsd.springboot.service.ProjectPortfolioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectPortfolioServiceImpl implements ProjectPortfolioService {

    @Autowired
    private ProjectPortfolioRepository projectPortfolioRepository;

    @Override
    public void saveProjectPortfolio(ProjectPortfolio projectPortfolio) {
        projectPortfolioRepository.save(projectPortfolio);
    }
}
