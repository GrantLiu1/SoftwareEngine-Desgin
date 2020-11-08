<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.Complaints"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from Complaints where cId like ?";
	List<Complaints> list=BaseDao.excuteQuery(sql,new ComplaintsMapper(),"%"+key+"%");
	out.print("<table id='ComplaintList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;'>");
	out.print("<tr>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>投诉编码</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>买家编码</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>被投诉商品编码</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>投诉内容</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>创建时间</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>投诉状态</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>操作</td>");
	out.print("</tr>");
	for(Complaints complaints:list){
		out.print("<tr>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+complaints.getCid()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+complaints.getUserID()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+complaints.getGid()+"</td>");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+complaints.getcContent()+"</td>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+complaints.getcTime()+"");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+complaints.iscState()+"</td>");
		out.print("<td width='200' align='center' valign='middle'><button class='btn-deal'>处理</button> <button class='btn-delete'>删除</button></td>");
		out.print("</td></tr>");
	}
	out.print("</table>");
%>