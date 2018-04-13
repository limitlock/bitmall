package com.cafe24.bitmall.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	public boolean insert(UserVo vo) {
		int count = sqlSession.insert("user.insert",vo);
		return count == 1;
	}

	// 로그인 (인터셉터에서 일어난다.)
	public UserVo getUser(UserVo vo) {
		return sqlSession.selectOne("user.getByIdAndPassword",vo);
		
	}

	public UserVo get(String id) {
		
		return sqlSession.selectOne("user.getById",id);
	}

	public boolean update(UserVo vo) {
		int count = sqlSession.update("user.userModify",vo);
		return count == 1;
	}


}
