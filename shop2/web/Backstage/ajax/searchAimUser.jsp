<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.User"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from User where userId like ? and uCheck = 1";
	List<User> list=BaseDao.excuteQuery(sql,new UserMapper(),"%"+key+"%");
	out.print("<table id='UserList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;'>");
	out.print("<tr>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>用户编码</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>用户帐号</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>用户昵称</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>手机号</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>申请状态</td>");
	out.print("<td width='200' align='center' valign='middle' bgcolor='#DDD'>操作</td>");
	out.print("</tr>");
	for(User user:list){
		out.print("<tr>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+user.getUserID()+"</td>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+user.getUserName()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+user.getNickName()+"");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+user.getPhone()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+user.isuCheck()+"</td>");
		out.print("<td width='200' align='center' valign='middle'><button class='btn-prove'>通过</button> <button class='btn-cancel'>拒绝</button>"); 
		out.print("</td></tr>");
	}
	out.print("</table>");
%>