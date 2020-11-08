package com.shop.entity;

import java.util.Date;

public class Evaluations {
	private int eID;          //唯一标识
	private int gID;          //商品ID
	private String eContent;  //评价内容
	private Date eTime;       //评价时间
	private int userID;       //买家id
	private User user;        
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int geteID() {
		return eID;
	}
	public void seteID(int eID) {
		this.eID = eID;
	}
	public int getgID() {
		return gID;
	}
	public void setgID(int gID) {
		this.gID = gID;
	}
	public String geteContent() {
		return eContent;
	}
	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	public Date geteTime() {
		return eTime;
	}
	public void seteTime(Date eTime) {
		this.eTime = eTime;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
}
