package com.cafe24.bitmall.repository;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.OrderProductVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.UserVo;

@Repository
public class OrderDao {

	@Autowired
	private SqlSession sqlSession;

	public List<CartVo> getCartProductList(Long userNo) {

		return sqlSession.selectList("cart.getCartProductList", userNo);
	}

	public List<OrderProductVo> getOrderCartProductList(Long userNo) {

		return sqlSession.selectList("cart.getCartProductList", userNo);
	}

	public List<UserVo> getUser(Long userNo) {
		return sqlSession.selectList("user.getUserAddress", userNo);

	}

	public void deleteAll(Long userNo) {
		sqlSession.delete("cart.deleteAll", userNo);

	}
	
	
	
	public void insertOrder(OrderVo vo) {
		sqlSession.insert("order.insert", vo);

	}

	

	public void insertOrderProductList(CartVo vo) {
		sqlSession.insert("order.insertOrderProductList", vo);
	}

	

	public Long getNo(String orderNo) {
		return sqlSession.selectOne("order.getOrderNo",orderNo);
	}
}
