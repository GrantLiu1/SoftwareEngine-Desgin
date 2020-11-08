<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.*"%>

<%
	User user = (User) session.getAttribute("user");
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from Goods where gId like ? and userID= ?";
	List<Goods> list=BaseDao.excuteQuery(sql,new GoodsMapper(),"%"+key+"%",user.getUserID());
	out.print("<table id='GoodsList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin: auto;'>");
	out.print("<tr>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品码</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品名</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品种类</td>");
	out.print("<td width='120' height='35' align='center' valign='middle' bgcolor='#DDD'>商品描述</td>");
	out.print("<td width='120' height='35' align='center' valign='middle' bgcolor='#DDD'>商品图片</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品库存</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品单价</td>");
//	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>慈善金</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品状态</td>");
	out.print("<td width='300' height='35' align='center' valign='middle' bgcolor='#DDD'>操作</td>");
	out.print("</tr>");
	for(Goods goods:list){
		out.print("<tr>");
		out.print("<td bgclor='white' width='100' height='40' align='center' valign='middle'>"+goods.getgID()+"</td>");
		out.print("<td bgclor='white' width='100' height='40' align='center' valign='middle'>"+goods.getgName()+"</td>");
		out.print("<td bgclor='white' width='100' height='40' align='center' valign='middle'>"+goods.getgKind()+"</td>");
		out.print("<td bgclor='white' width='120' height='40' align='center' valign='middle'><img src="+request.getContextPath()+"/"+goods.getgDes()+" style='width: 100px;height: 100px;margin:5px'/></td>");
		out.print("<td bgclor='white' width='120' height='40' align='center' valign='middle'><img src="+request.getContextPath()+"/"+goods.getgPic()+" style='width: 100px;height: 100px;margin:5px'/></td>");
		out.print("<td bgclor='white' width='100' height='40' align='center' valign='middle'>"+goods.getgAmount()+"</td>");
		out.print("<td bgclor='white' width='100' height='40' align='center' valign='middle'>"+goods.getgPrice()+"</td>");
//		out.print("<td bgclor='white' width='100' height='40' align='center' valign='middle'>"+goods.getgChar()+"</td>");
		out.print("<td bgclor='white' width='100' height='40' align='center' valign='middle'>"+goods.isgCheck()+"</td>");
		out.print("<td bgclor='white' width='300' align='center' valign='middle'><button class='btn-change'>修改</button> <button class='btn-delete'>删除</button> <button class='btn-eva'>评价</button>"); 
		out.print("</td></tr>");
	}
	out.print("</table>");
	
%>