package com.shop.entity;

public class User {
	private int userID;         //唯一标识
	private String userName;    //账号
	private String userPwd;     //密码
	private String headPic;     //头像
	private String nickName;    //昵称
	private boolean userType;   //身份（0为买家，1为卖家）
	private boolean kuserType;   //身份（0为买家，1为快递员）
	private String IDNum;       //身份证
	private String phone;       //手机号
	private double charity;     //慈善点
	private int honest;         //诚信点
	private boolean uCheck;      //买家申请审核（0为未申请，1为申请）
	private boolean kCheck;      //快递员申请审核（0为未申请，1为申请）
	
	public boolean isuCheck() {
		return uCheck;
	}
	public void setuCheck(boolean uCheck) {
		this.uCheck = uCheck;
	}
	public boolean iskCheck() {
		return kCheck;
	}
	public void setkCheck(boolean kCheck) {
		this.kCheck = kCheck;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getHeadPic() {
		return headPic;
	}
	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public boolean isUserType() {
		return userType;
	}
	public void setUserType(boolean userType) {
		this.userType = userType;
	}

	public boolean isKuserType() {
		return kuserType;
	}
	public void setKuserType(boolean kuserType) {
		this.kuserType = kuserType;
	}

	public String getIDNum() {
		return IDNum;
	}
	public void setIDNum(String iDNum) {
		IDNum = iDNum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getCharity() {
		return charity;
	}
	public void setCharity(double charity) {
		this.charity = charity;
	}
	public int getHonest() {
		return honest;
	}
	public void setHonest(int honest) {
		this.honest = honest;
	}
}
