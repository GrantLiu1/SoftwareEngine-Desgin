package com.shop.entity;

public class Indexs {
	private int iID;         //唯一标识
	private String iName;    //标题内容
	private String iSName;   //二级标题内容
	private String iPic;     //图片
	private String iUrl;     //链接
	private String iKind;    //位置
	
	public String getiKind() {
		return iKind;
	}
	public void setiKind(String iKind) {
		this.iKind = iKind;
	}
	public int getiID() {
		return iID;
	}
	public void setiID(int iID) {
		this.iID = iID;
	}
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public String getiSName() {
		return iSName;
	}
	public void setiSName(String iSName) {
		this.iSName = iSName;
	}
	public String getiPic() {
		return iPic;
	}
	public void setiPic(String iPic) {
		this.iPic = iPic;
	}
	public String getiUrl() {
		return iUrl;
	}
	public void setiUrl(String iUrl) {
		this.iUrl = iUrl;
	}
}
