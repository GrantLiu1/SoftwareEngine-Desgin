<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.Goods"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	out.print("<div id='delete' align='center'>");
	out.print("<input type='text' id='gId' style='display:none' name='gId' value='"+key+"'/>" );
	out.print("</div>");
	
%>