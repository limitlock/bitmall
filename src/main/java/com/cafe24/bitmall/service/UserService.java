package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.UserDao;
import com.cafe24.bitmall.vo.UserVo;

@Service
public class UserService {

	@Autowired
	UserDao userDao;

	// 회원가입
	public void join(UserVo vo) {
		userDao.insert(vo);
	}

	//로그인
	public UserVo getUser(UserVo vo) {
		return userDao.getUser(vo);
	}

	// 아이디 중복 검증
	public UserVo checkId(String id) {
		
		return userDao.get(id);
	}

	// 회원 정보 수정
	public void modify(UserVo vo) {
		userDao.update(vo);
	}


}
