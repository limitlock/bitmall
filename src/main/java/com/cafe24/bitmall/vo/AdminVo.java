package com.cafe24.bitmall.vo;

public class AdminVo {

	private Long no;
	private String id;
	private String password;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "AdminVo [no=" + no + ", id=" + id + ", password=" + password + "]";
	}

}
