package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.JumunVo;
import com.cafe24.bitmall.vo.OrderProductVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.UserVo;

@Repository
public class JumunDao {

	@Autowired
	private SqlSession sqlSession;

	public List<JumunVo> getJumunList(Long no) {
		return sqlSession.selectList("jumun.getJumunList", no);
	}

	public List<OrderVo> getOrderInfo(Long orderNo) {
		return sqlSession.selectList("jumun.getOrderInfo", orderNo);
	}

	public List<UserVo> getSender(Long userNo) {

		return sqlSession.selectList("jumun.getSender", userNo);
	}

	public Long getNo(Long orderNo) {

		return sqlSession.selectOne("jumun.getNo", orderNo);
	}

	public List<OrderProductVo> getOrderProductList(Long orderInfoNo) {

		return sqlSession.selectList("jumun.getProductList", orderInfoNo);
	}

	public Long getPrice(Long orderInfoNo) {

		return sqlSession.selectOne("jumun.getPrice", orderInfoNo);
	}

}
