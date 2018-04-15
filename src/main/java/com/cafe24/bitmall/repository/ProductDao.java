package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ProductVo;

@Repository
public class ProductDao {
	@Autowired
	private SqlSession sqlSession;

	public List<ProductVo> getProductList(Long categoryNo, Long page) {
		page = (page - 1) * 5;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("page", page);
		
		return sqlSession.selectList("main.getProductListByCategory",map);
	}

	public Long getMax(Long categoryNo) {
		return sqlSession.selectOne("main.getMax",categoryNo);
	}
}
