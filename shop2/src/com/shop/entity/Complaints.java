package com.shop.entity;

import java.util.Date;

public class Complaints {
	private int cid;           //唯一标识
	private int userID;        //买家id
	private String cContent;   //投诉内容
	private Date cTime;        //投诉时间
	private boolean cState;    //处理状态（0为未处理，1为已处理）
	private String cResult;    //处理结果
	private int gid;           //投诉商品id
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getcResult() {
		return cResult;
	}
	public void setcResult(String cResult) {
		this.cResult = cResult;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public Date getcTime() {
		return cTime;
	}
	public void setcTime(Date cTime) {
		this.cTime = cTime;
	}
	public boolean iscState() {
		return cState;
	}
	public void setcState(boolean cState) {
		this.cState = cState;
	}
}
