<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	out.print("<div id='deal' align='center'>");
	out.print("<input type='text' id='cId' style='display:none' name='cId' value='"+key+"'/>" );
	out.print("</div>");
%>