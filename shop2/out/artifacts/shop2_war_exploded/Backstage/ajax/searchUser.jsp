<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.User"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from User where userId like ?";
	List<User> list=BaseDao.excuteQuery(sql,new UserMapper(),"%"+key+"%");
	out.print("<table id='UserList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;'>");
	out.print("<tr>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>用户编码</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>用户帐号</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>用户头像</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>用户昵称</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>用户身份</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>身份证号</td>");
	out.print("<td width='150' height='35' align='center' valign='middle' bgcolor='#DDD'>手机号</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>慈善金</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>诚信点</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>是否是卖家</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>操作</td>");
	out.print("</tr>");
	for(User user:list){
		out.print("<tr>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+user.getUserID()+"</td>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+user.getUserName()+"</td>");
		out.print("<td width='150' height='40' align='center' valign='middle'><img src="+request.getContextPath()+"/"+user.getHeadPic()+" style='width: 100px;height: 100px;margin:5px'/></td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+user.getNickName()+"");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+user.isUserType()+"</td>");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+user.getIDNum()+"</td>");
		out.print("<td width='150' height='40' align='center' valign='middle'>"+user.getPhone()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+user.getCharity()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+user.getHonest()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+user.isuCheck()+"</td>");
		out.print("<td width='100' align='center' valign='middle'><button class='btn-delete'>删除</button></td>");
		out.print("</td></tr>");
	}
	out.print("</table>");
%>