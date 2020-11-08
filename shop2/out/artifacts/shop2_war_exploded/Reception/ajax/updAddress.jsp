<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	int key=Integer.parseInt(new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8"));
	out.print("<td width='300' id='change' height='30' valign='middle'>");
	out.print("<input type='text' id='AID' name='AID' style='display:none;' value='"+key+"'>");
	out.print("<textarea name='address2' id='address2' style='width: 300px; height: 50px;'></textarea>");
	out.print("</td>");
%>