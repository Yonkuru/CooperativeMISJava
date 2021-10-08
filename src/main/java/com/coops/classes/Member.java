package com.coops.classes;

public class Member {
	private int id, cooperative, memberCount, memberPercent;
	private String cooperativeName, firstname, lastname, phone, email, password, userTypeDesc;
	private int userType, status;
	private String regDate;
	
	
	public int getMemberPercent() {
		return memberPercent;
	}
	public void setMemberPercent(int memberPercent) {
		this.memberPercent = memberPercent;
	}
	public int getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}
	public String getCooperativeName() {
		return cooperativeName;
	}
	public void setCooperativeName(String cooperativeName) {
		this.cooperativeName = cooperativeName;
	}
	public String getUserTypeDesc() {
		return userTypeDesc;
	}
	public void setUserTypeDesc(String userTypeDesc) {
		this.userTypeDesc = userTypeDesc;
	}
	public int getCooperative() {
		return cooperative;
	}
	public void setCooperative(int cooperative) {
		this.cooperative = cooperative;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
