package com.shop.entity;

public class Address {
	private int aID;           //唯一标识
	private int userID;        //买家id
	private String aContent;   //内容
	
	public int getaID() {
		return aID;
	}
	public void setaID(int aID) {
		this.aID = aID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}	
}
