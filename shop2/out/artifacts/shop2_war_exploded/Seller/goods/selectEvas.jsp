<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.*"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	out.print("<div id='select' align='center'>");
	out.print("<br>");
	String sql="select * from Evaluation where gId = ?";
	List<Evaluations> list=BaseDao.excuteQuery(sql,new EvaluationMapper(),key);
	out.print("<table id='GoodsList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;'>");
	out.print("<tr>");
	out.print("<td width='230' height='35' align='center' valign='middle' bgcolor='#DDD'>评价内容</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>买家编码</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>创建时间</td>");
	out.print("</tr>");
	for(Evaluations eva:list){
		out.print("<tr>");
		out.print("<td width='230' height='40' align='center' valign='middle'>"+eva.geteContent()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+eva.getUserID()+"</td>");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+eva.geteTime()+"</td>");		out.print("</td></tr>");
	}
	out.print("</table>");
	out.print("<br>");out.print("<br>");
	out.print("<input type='text' id='gId' style='display:none' name='gId' value='"+key+"'/>" );
	out.print("</div>");
	
%>