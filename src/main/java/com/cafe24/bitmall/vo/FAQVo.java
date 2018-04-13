package com.cafe24.bitmall.vo;

public class FAQVo {

	private Long no;
	private String title;
	private String content;
	private Long adminNo;

	public Long getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(Long adminNo) {
		this.adminNo = adminNo;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "FAQVo [no=" + no + ", title=" + title + ", content=" + content + ", adminNo=" + adminNo + "]";
	}

}
