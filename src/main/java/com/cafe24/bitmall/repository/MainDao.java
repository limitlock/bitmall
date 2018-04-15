package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ProductVo;

@Repository
public class MainDao {
	@Autowired
	private SqlSession sqlSession;

	public List<ProductVo> getAllProductList() {
		
		return sqlSession.selectList("main.getAllProductList");
	}

}
