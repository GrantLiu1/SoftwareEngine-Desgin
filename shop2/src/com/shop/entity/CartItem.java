package com.shop.entity;

public class CartItem {
	private int cartItemId;
	private int sellerId;
	private int UserId;
	private String gName;
	private String gPic;
	private double gPrice;
	private int buyNum;
	private double totalPrice;
	private int gId;
	
	
	public int getgId() {
		return gId;
	}
	public void setgId(int gId) {
		this.gId = gId;
	}
	public int getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgPic() {
		return gPic;
	}
	public void setgPic(String gPic) {
		this.gPic = gPic;
	}
	public double getgPrice() {
		return gPrice;
	}
	public void setgPrice(double gPrice) {
		this.gPrice = gPrice;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
