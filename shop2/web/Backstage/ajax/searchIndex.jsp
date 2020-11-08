<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.shop.dao.BaseDao"%>
<%@ page import="com.shop.mapper.*"%>
<%@ page import="com.shop.entity.Indexs"%>

<%
	String key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"utf-8");
	String sql="select * from Indexs where iId like ?";
	List<Indexs> list=BaseDao.excuteQuery(sql,new IndexsMapper(),"%"+key+"%");
	out.print("<table id='IndexList' border='1' cellspacing='0' style='border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;'>");
	out.print("<tr>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>广告编码</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>广告标题</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>广告副标题</td>");
	out.print("<td width='200' height='35' align='center' valign='middle' bgcolor='#DDD'>广告图片</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>图片链接</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>广告类别</td>");
	out.print("<td width='100' height='35' align='center' valign='middle' bgcolor='#DDD'>操作</td>");
	out.print("</tr>");
	for(Indexs index:list){
		out.print("<tr>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+index.getiID()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+index.getiName()+"</td>");
		out.print("<td width='200' height='40' align='center' valign='middle'>"+index.getiSName()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'><img src="+request.getContextPath()+"/"+index.getiPic()+" style='width: 100px;height: 100px;margin:5px'/></td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+index.getiUrl()+"</td>");
		out.print("<td width='100' height='40' align='center' valign='middle'>"+index.getiKind()+"</td>");
		out.print("<td width='100' align='center' valign='middle'><button class='btn-delete'>删除</button></td>");
		out.print("</td></tr>");
	}
	out.print("</table>");
%>