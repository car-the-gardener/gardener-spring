package com.gardener.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gardener.domain.Search;
import com.gardener.mappers.HomeMapper;
import com.gardener.mappers.SearchMapper;

@Service
public class HomeService {

    @Autowired
    private HomeMapper mapper;
    
    public List<Search> FavoriteTop() {
    	return mapper.FavoriteTop();
    }
    
    public List<Search> TopCollection() {
    	return mapper.TopCollection();
    }
    
   
    
    
    
    
    
    
    
    
    
}
