package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.JumunVo;

@Repository
public class JumunDao {

	@Autowired
	private SqlSession sqlSession;

	public List<JumunVo> getJumunList(Long no) {
		return sqlSession.selectList("jumun.getJumunList",no);
	}

}
