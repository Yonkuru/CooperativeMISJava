package com.coops.classes;

public class StockLog {
	private int id, account, stock, member;
	private String stockName;
	private double quantity, uPrice;
	private String regDate, memberFirstname, memberLastname;
	
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public double getuPrice() {
		return uPrice;
	}
	public void setuPrice(double uPrice) {
		this.uPrice = uPrice;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getMemberFirstname() {
		return memberFirstname;
	}
	public void setMemberFirstname(String memberFirstname) {
		this.memberFirstname = memberFirstname;
	}
	public String getMemberLastname() {
		return memberLastname;
	}
	public void setMemberLastname(String memberLastname) {
		this.memberLastname = memberLastname;
	}	
}
