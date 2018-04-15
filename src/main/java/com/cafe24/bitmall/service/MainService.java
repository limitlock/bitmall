package com.cafe24.bitmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.MainDao;

@Service
public class MainService {
	
	@Autowired
	private MainDao mainDao;

}
