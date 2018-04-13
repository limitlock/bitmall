package com.cafe24.bitmall.vo;

public class OptionVo {

	private Long no;
	private String title;
	private Long productNo;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getProductNo() {
		return productNo;
	}

	public void setProductNo(Long productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "OptionVo [no=" + no + ", title=" + title + ", productNo=" + productNo + "]";
	}

}
