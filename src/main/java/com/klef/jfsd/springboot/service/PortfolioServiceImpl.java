package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Portfolio;
import com.klef.jfsd.springboot.repository.PortfolioRepository;
import com.klef.jfsd.springboot.service.PortfolioService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PortfolioServiceImpl implements PortfolioService {

    @Autowired
    private PortfolioRepository portfolioRepository;

    @Override
    public Portfolio getPortfolioByStudentId(int studentId) {
        return portfolioRepository.findPortfolioByStudentId(studentId);
    }

    @Override
    public void savePortfolio(Portfolio portfolio) {
        portfolioRepository.save(portfolio);
    }

//	
//	  @Override 
//	  public List<Portfolio> getPortfoliosByMentor(Mentor mentor) {
//	  return portfolioRepository.findByMentor(mentor); }

}
