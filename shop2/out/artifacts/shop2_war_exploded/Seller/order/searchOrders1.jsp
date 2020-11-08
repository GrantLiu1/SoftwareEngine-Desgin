<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.*"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	User user = (User) session.getAttribute("user");
	String sql="select * from orders where oId like ? && gId in (select gId from goods where userId = ?) && oState = '已发货'";
	List<Orders> list=BaseDao.excuteQuery(sql,new OrdersMapper(),"%"+key+"%",user.getUserID());
	out.print("<table id='OrderList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;'>");
	out.print("<tr>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>订单编码</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>商品编码</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品数量</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>订单金额</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>订单状态</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>订单备注</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>创建时间</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>买家ID</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>买家地址</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>操作</td>");
	out.print("</tr>");
	for(Orders order:list){
		out.print("<tr>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+order.getoID()+"</td>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+order.getgID()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+order.getoNum()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+order.getoPrice()+"");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+order.getoState()+"</td>");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+order.getoTip()+"</td>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+order.getoTime()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+order.getUserID()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+order.getUserAddress()+"</td>");
		out.print("<td width='100' align='center' valign='middle'><button class='btn-delete'>删除</button></td>");
		out.print("</td></tr>");
	}
	out.print("</table>");
%>