<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.shop.dao.*,com.shop.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的投诉</title>
<style type="text/css">
.btn{
	width:70px; 
	height:30px; 
	color: white; 
	text-align:center;
	font-size:12px;
	background-color:#666;
	cursor:pointer;
	border:none;
	border-radius:2px;
	margin:1px;
}

label{
	overflow : hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}
</style>
</head>

<body style="margin:0px; padding:0px; background-color: #FFF">
	<table width="100%" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid;">
      <tr>
        <td width="100" height="50" align="center" valign="middle" bgcolor="#DDD">商品名</td>
        <td width="250" height="50" align="center" valign="middle" bgcolor="#DDD">投诉内容</td>
        <td width="50" height="50" align="center" valign="middle" bgcolor="#DDD">投诉状态</td>
        <td width="50" height="50" align="center" valign="middle" bgcolor="#DDD">处理结果</td>
        <td width="30" height="50" align="center" valign="middle" bgcolor="#DDD">操作</td>
      </tr>
      <% ComplaintsDao dao=new ComplaintsDao();
      	 GoodsDao goodsDao=new GoodsDao();
      	 User user = (User) session.getAttribute("user");
      	 String state = null;
         List<Complaints> list=dao.selectUserComplaints(user.getUserID());   
         for(Complaints comp:list) {
        	 if(!comp.iscState())
        		 state="未处理";
        	 else
        		 state="已处理";
        	 Goods good=goodsDao.findGoodById(comp.getGid());
      %>
      <tr>
        <td width="100" height="40" align="center" valign="middle"><label><%=good.getgName() %></label></td>
        <td width="250" height="40" align="center" valign="middle"><%=comp.getcContent() %></td>
        <td width="50" height="40" align="center" valign="middle"><%=state %></td>
        <td width="50" height="40" align="center" valign="middle"><%=comp.getcResult() %></td>
        <td width="30" height="40" align="center" valign="middle">
        	<form style="margin: 0px;padding: 0px;" action="${pageContext.request.contextPath}/complaintsServlet?method=delComp" method="post"> 
            	<input type="submit" class="btn" value="删除">
            	<input type="text" name="key" id="key" value=<%=comp.getCid()%> style="display:none;">
            </form>
        </td>
      </tr>
      <%}%>
    </table>
</body>
</html>