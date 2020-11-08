package com.shop.entity;

public class Goods {
	private int gID;           //唯一标识,自增长
	private int userID;        //卖家id
	private String gName;      //商品名称
	private String gDes;       //商品描述
	private String gPic;       //商品封面图片
	private int gAmount;       //库存
	private double gChar;      //慈善金
	private boolean gCheck;    //商品发布审核
	private String gKind;      //商品类别
	private double gPrice;     //商品价格

	public double getgPrice() {
		return gPrice;
	}
	public void setgPrice(double gPrice) {
		this.gPrice = gPrice;
	}
	public String getgKind() {
		return gKind;
	}
	public void setgKind(String gKind) {
		this.gKind = gKind;
	}
	public int getgID() {
		return gID;
	}
	public void setgID(int gID) {
		this.gID = gID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgDes() {
		return gDes;
	}
	public void setgDes(String gDes) {
		this.gDes = gDes;
	}
	public String getgPic() {
		return gPic;
	}
	public void setgPic(String gPic) {
		this.gPic = gPic;
	}
	public int getgAmount() {
		return gAmount;
	}
	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}
	public double getgChar() {
		return gChar;
	}
	public void setgChar(double gChar) {
		this.gChar = gChar;
	}
	public boolean isgCheck() {
		return gCheck;
	}
	public void setgCheck(boolean gCheck) {
		this.gCheck = gCheck;
	}
}
