package com.shop.entity;

public class Store {
	private int sID;         //唯一标识
	private int userID;      //买家id
	private int gID;         //商品id
	
	public int getsID() {
		return sID;
	}
	public void setsID(int sID) {
		this.sID = sID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getgID() {
		return gID;
	}
	public void setgID(int gID) {
		this.gID = gID;
	}
}
