package com.coops.classes;

public class Payment {
	private int id, account, member;
	private double amount;
	private String regDate, memberFirstname, memberLastname;
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
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
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
