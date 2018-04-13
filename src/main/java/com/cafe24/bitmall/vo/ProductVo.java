package com.cafe24.bitmall.vo;

public class ProductVo {

	private Long no;
	private Long categoryNo;
	private String productCode;
	private String title;
	private String maker;
	private String price;
	private String info;
	private String status;
	private String icon;

	private String file1;
	private String file2;
	private String file3;

	private Long optNo1;
	private Long optNo2;

	private Long discount = 0L;

	private String regDate;

	
	
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Long getDiscount() {
		return discount;
	}

	public void setDiscount(Long discount) {
		this.discount = discount;
	}

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Long categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}

	public Long getOptNo1() {
		return optNo1;
	}

	public void setOptNo1(Long optNo1) {
		this.optNo1 = optNo1;
	}

	public Long getOptNo2() {
		return optNo2;
	}

	public void setOptNo2(Long optNo2) {
		this.optNo2 = optNo2;
	}

	@Override
	public String toString() {
		return "ProductVo [no=" + no + ", categoryNo=" + categoryNo + ", productCode=" + productCode + ", title="
				+ title + ", maker=" + maker + ", price=" + price + ", info=" + info + ", status=" + status + ", icon="
				+ icon + ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3 + ", optNo1=" + optNo1
				+ ", optNo2=" + optNo2 + ", discount=" + discount + ", regDate=" + regDate + "]";
	}

}
