package com.shop.entity;

import java.util.Date;

public class Orders {
	private int oID;             //唯一标识
	private int gID;             //商品id
	private int oNum;            //购买数量
	private double oPrice;       //订单金额
	private String oState;       //订单状态
	private String oTip;         //订单备注
	private Date oTime;          //订单创建时间
	private int userID;          //买家id
	private String userAddress;  //收货地址
	
	public int getoID() {
		return oID;
	}
	public void setoID(int oID) {
		this.oID = oID;
	}
	public int getgID() {
		return gID;
	}
	public void setgID(int gID) {
		this.gID = gID;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public double getoPrice() {
		return oPrice;
	}
	public void setoPrice(double oPrice) {
		this.oPrice = oPrice;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	public String getoTip() {
		return oTip;
	}
	public void setoTip(String oTip) {
		this.oTip = oTip;
	}
	public Date getoTime() {
		return oTime;
	}
	public void setoTime(Date oTime) {
		this.oTime = oTime;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
}
