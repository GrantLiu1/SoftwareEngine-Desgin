<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.shop.dao.*,com.shop.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的订单</title>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<style type="text/css">
.btn,.btn-upd{
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
<script>
$(function() {
 	$("#dialog").dialog({
      height: 200,
      width: 550,
      resizable: false,
      modal: true,
      autoOpen: false,
      show: {
        effect: "clip",
        duration: 200
      },
    });
    
    $(".btn").click(function() {
    	var xmlhttp; 
	  	var key=$(this).parent().parent().children().first().text().trim();
	  	if (window.XMLHttpRequest){
	    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
	    	xmlhttp=new XMLHttpRequest();
	  	}
	  	else{
	    	// IE6, IE5 浏览器执行代码
	    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  	}
	  	xmlhttp.onreadystatechange=function(){
	    	if (xmlhttp.readyState==4 && xmlhttp.status==200){
	       		document.getElementById("change").innerHTML=xmlhttp.responseText;
	    	}
	  	}
	    xmlhttp.open("GET","ajax/ensureGoods.jsp?key="+key,true);
	  	xmlhttp.send();
		$("#dialog").dialog( "open" );
	});
 });
</script>
</head>

<body style="margin:0px; padding:0px; background-color: #FFF">
	<table width="100%" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid;">
      <tr>
        <td width="50" height="50" align="center" valign="middle" bgcolor="#DDD">订单号</td>
        <td width="100" height="50" align="center" valign="middle" bgcolor="#DDD">商品名</td>
        <td width="50" height="50" align="center" valign="middle" bgcolor="#DDD">金额</td>
        <td width="70" height="50" align="center" valign="middle" bgcolor="#DDD">订单状态</td>
        <td width="100" height="50" align="center" valign="middle" bgcolor="#DDD">下单时间</td>
        <td width="100" height="50" align="center" valign="middle" bgcolor="#DDD">操作</td>
      </tr>
      <% OrdersDao dao=new OrdersDao();
	  	 GoodsDao goodsDao=new GoodsDao();
      	 User user = (User) session.getAttribute("user");
         List<Orders> list=dao.selectOrdersByUserID(user.getUserID());   
         for(Orders orders:list){
        	Goods goods = goodsDao.findGoodById(orders.getgID());
      %>
      <tr>
        <td width="50" height="40" align="center" valign="middle"><%=orders.getoID()%></td>
        <td width="100" height="40" align="center" valign="middle"><label><%=goods.getgName()%></label></td>
        <td width="50" height="40" align="center" valign="middle"><%=orders.getoPrice()%></td>
        <td width="70" height="40" align="center" valign="middle"><%=orders.getoState()%></td>
        <td width="100" height="40" align="center" valign="middle"><%=orders.getoTime()%></td>
        <td width="100" height="40" align="center" valign="middle">
        <%if(!"已收货".equals(orders.getoState())){%>
        	<input type="button" class="btn" value="确认收货"> 
        <%}%>
        </td>
      </tr>
      <%}%>
    </table>
    
    <div id="dialog" title="确认收货">
		<form action="${pageContext.request.contextPath}/orders?method=ensureGoods" method="post">
			<table border="0">
			  <tr>
			    <td width="100" height="30" align="right" valign="top">评价内容：</td>
			    <td width="300" id="change" height="30" valign="middle"></td>
			    <td width="100" height="30" valign="middle">&nbsp;</td>
			  </tr>
			  <tr>
			    <td width="100" height="50" valign="middle">&nbsp;</td>
			    <td width="300" height="50" valign="middle">&nbsp;</td>
			    <td width="100" height="50" valign="middle">
			    	<input type="submit" class="btn" value="提交">
			    </td>
			  </tr>
			</table>
		</form>
	</div>
	
</body>
</html>