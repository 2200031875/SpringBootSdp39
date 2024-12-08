package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Article;
import com.klef.jfsd.springboot.repository.ArticleRepository;
import com.klef.jfsd.springboot.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    @Override
    public void saveArticle(Article article) {
        articleRepository.save(article);
    }
}
