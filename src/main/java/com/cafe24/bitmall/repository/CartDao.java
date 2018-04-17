package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVo;

@Repository
public class CartDao {

	@Autowired
	private SqlSession sqlSession;

	public void insert(CartVo vo) {
		sqlSession.insert("cart.insert", vo);

	}

	public List<CartVo> getCartProductList(Long userNo) {

		return sqlSession.selectList("cart.getCartProductList", userNo);
	}

	public void delete(Long productNo) {
		sqlSession.delete("cart.deleteSelected", productNo);
	}

	public void deleteAll(Long userNo) {
		sqlSession.delete("cart.deleteAll", userNo);

	}

}
