package com.cafe24.bitmall.vo;

public class CartVo {
	private Long no;
	private Long userNo;
	private String optNo1;
	private String optNo2;

	private String num;
	private String price;
	private String result_price;
	private String productTitle;
	private String productNo;

	private String file1;

	private Long orderNo;

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public String getOptNo1() {
		return optNo1;
	}

	public void setOptNo1(String optNo1) {
		this.optNo1 = optNo1;
	}

	public String getOptNo2() {
		return optNo2;
	}

	public void setOptNo2(String optNo2) {
		this.optNo2 = optNo2;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getResult_price() {
		return result_price;
	}

	public void setResult_price(String result_price) {
		this.result_price = result_price;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	@Override
	public String toString() {
		return "CartVo [no=" + no + ", userNo=" + userNo + ", optNo1=" + optNo1 + ", optNo2=" + optNo2 + ", num=" + num
				+ ", price=" + price + ", result_price=" + result_price + ", productTitle=" + productTitle
				+ ", productNo=" + productNo + ", file1=" + file1 + ", orderNo=" + orderNo + "]";
	}

}
