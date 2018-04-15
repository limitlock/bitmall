package com.cafe24.bitmall.vo;

public class OptsVo {

	private Long no;
	private String title;
	private Long optNo;

	public Long getOptNo() {
		return optNo;
	}

	public void setOptNo(Long optNo) {
		this.optNo = optNo;
	}

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

	@Override
	public String toString() {
		return "OptsVo [no=" + no + ", title=" + title + ", optNo=" + optNo + "]";
	}

}
