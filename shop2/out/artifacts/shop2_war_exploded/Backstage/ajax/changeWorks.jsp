<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	out.print("<td id='change'>");
	out.print("<input type='text' id='key_3' name='key_3' value ="+ key+" style='display:none;'/>");
	out.print("<input type='submit' value='提交' class='btn-upd' style='float:right'/>");
	out.print("</td>");
%>
