<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.Evaluations"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from Evaluation where eId like ?";
	List<Evaluations> list=BaseDao.excuteQuery(sql,new EvaluationMapper(),"%"+key+"%");
	out.print("<table id='EvaluationList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;'>");
	out.print("<tr>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>评价编码</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>商品编码</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>评价内容</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>创建时间</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>买家编号</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>操作</td>");
	out.print("</tr>");
	for(Evaluations e:list){
		out.print("<tr>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+e.geteID()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+e.getgID()+"</td>");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+e.geteContent()+"</td>");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+e.geteTime()+"");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+e.getUserID()+"</td>");
		out.print("<td width='100' align='center' valign='middle'><button class='btn-delete'>删除</button></td>");
		out.print("</td></tr>");
	}
	out.print("</table>");
%>