package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Portfolio;

public interface PortfolioService {
    Portfolio getPortfolioByStudentId(int studentId);
    void savePortfolio(Portfolio portfolio);
	//List<Portfolio> getPortfoliosByMentor(Mentor mentor);
	//List<Portfolio> getPortfoliosByMentor(Mentor mentor);
    
}
