package com.coops.classes;

public class Announcement {
	private int id, member, status, messageId, readCount, unreadCount, allCount;
	private String title, message, regDate;
	
	
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getUnreadCount() {
		return unreadCount;
	}
	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
