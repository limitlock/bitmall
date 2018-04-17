package com.cafe24.bitmall.vo;

public class OrderVo {

	private Long no;
	private String orderNo; // 주문번호
	private String statusNo; // 주문상태
	private String name;

	private String tel;
	private String phone;
	private String email;
	private String address;
	private String zip;
	private String req; // 요구사항

	private Long userNo; // 주문자 번호

	/////////////// 결제방식///////////////////////////

	private String payMethod;
	private String cardKind;
	private String cardNo;
	private String cardDate;
	private String cardPw;
	private String cardHalbu;
	private String bankKind;
	private String bankSender;

	public String getStatusNo() {
		return statusNo;
	}

	public void setStatusNo(String statusNo) {
		this.statusNo = statusNo;
	}

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getReq() {
		return req;
	}

	public void setReq(String req) {
		this.req = req;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getCardKind() {
		return cardKind;
	}

	public void setCardKind(String cardKind) {
		this.cardKind = cardKind;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardDate() {
		return cardDate;
	}

	public void setCardDate(String cardDate) {
		this.cardDate = cardDate;
	}

	public String getCardPw() {
		return cardPw;
	}

	public void setCardPw(String cardPw) {
		this.cardPw = cardPw;
	}

	public String getCardHalbu() {
		return cardHalbu;
	}

	public void setCardHalbu(String cardHalbu) {
		this.cardHalbu = cardHalbu;
	}

	public String getBankKind() {
		return bankKind;
	}

	public void setBankKind(String bankKind) {
		this.bankKind = bankKind;
	}

	public String getBankSender() {
		return bankSender;
	}

	public void setBankSender(String bankSender) {
		this.bankSender = bankSender;
	}

	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderNo=" + orderNo + ", statusNo=" + statusNo + ", name=" + name + ", tel="
				+ tel + ", phone=" + phone + ", email=" + email + ", address=" + address + ", zip=" + zip + ", req="
				+ req + ", userNo=" + userNo + ", payMethod=" + payMethod + ", cardKind=" + cardKind + ", cardNo="
				+ cardNo + ", cardDate=" + cardDate + ", cardPw=" + cardPw + ", cardHalbu=" + cardHalbu + ", bankKind="
				+ bankKind + ", bankSender=" + bankSender + "]";
	}

}
