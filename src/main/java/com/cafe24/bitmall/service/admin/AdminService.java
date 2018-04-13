package com.cafe24.bitmall.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.admin.AdminDao;
import com.cafe24.bitmall.vo.AdminVo;

@Service
public class AdminService {
	@Autowired
	AdminDao adminDao;

	public AdminVo login(AdminVo vo) {
		return adminDao.login(vo);
	}

	
}
