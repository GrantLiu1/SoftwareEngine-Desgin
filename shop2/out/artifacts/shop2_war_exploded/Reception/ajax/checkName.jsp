<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.User"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from user";
	List<User> list=BaseDao.excuteQuery(sql,new UserMapper());
	for(User user:list){
		if(user.getUserName().equals(key)){
			out.print("<label id='result' style='color:red;' name='result'>用户名已存在！</label>");
		}
	}
%>