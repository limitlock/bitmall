package com.cafe24.bitmall.repository.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.AdminVo;

@Repository
public class AdminDao {
	@Autowired
	SqlSession sqlSession;

	public AdminVo login(AdminVo vo) {

		System.out.println("dao: "+vo);
		return sqlSession.selectOne("admin.getAdmin",vo);
		
	}

}
