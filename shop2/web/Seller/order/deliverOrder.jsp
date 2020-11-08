<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shop.dao.OrdersDao,com.shop.entity.*,java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未发货订单</title>
	<link rel="stylesheet" type="text/css" href="../css/main-middle.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</head>
<script>
function searchOrder(){
	  var xmlhttp; 
	  var key=document.getElementById("key_code").value;   
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
	       document.getElementById("OrderList").innerHTML=xmlhttp.responseText;
	    }
	  }
	  xmlhttp.open("GET","searchOrders2.jsp?key="+key,false);
	  xmlhttp.send();
	}
</script>



<body>
	<!-- 引入header.jsp -->
	<jsp:include page="../sellerHeader.jsp"></jsp:include>
	
	<div  style="text-align:center;height: 100%;background: url('${pageContext.request.contextPath}/Seller/images/regist_bg.jpg');">
	        <input name="key_code" type="text" id="key_code" placeholder="请输入订单编码" class="textfild">
		    <button class="btn" onClick="searchOrder()">查找订单</button>
     <table id="OrderList" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid; margin:auto;margin-top:10px;">
         <tr>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">订单编码</td>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">商品编码</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品数量</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">订单金额</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">订单状态</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">订单备注</td>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">创建时间</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">买家ID</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">买家地址</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">操作</td>
         </tr>
  		 <%
	        OrdersDao orderDao=new OrdersDao();
	 		//从session读取卖家id
	 		User user = (User) session.getAttribute("user");
	 		List<Orders> list=orderDao.selectDeliverGoods(user.getUserID());
	        for(Orders order:list)
         {%>
         <tr>
           <td bgcolor="white" width="150" height="40" align="center" valign="middle"><%=order.getoID()%></td>
           <td bgcolor="white" width="150" height="40" align="center" valign="middle"><%=order.getgID()%></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=order.getoNum()%></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=order.getoPrice()%>
           <td bgcolor="white" width="200" height="40" align="center" valign="middle"><%=order.getoState()%></td>
           <td bgcolor="white" width="200" height="40" align="center" valign="middle"><%=order.getoTip()%></td>
           <td bgcolor="white" width="150" height="40" align="center" valign="middle"><%=order.getoTime()%></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=order.getUserID()%></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=order.getUserAddress()%></td>
           <td bgcolor="white" width="100" align="center" valign="middle">
           <form action="${pageContext.request.contextPath}/orders?method=deliverGoods" method="post">
	           <input type="text" id = "oId" name="oId" value=<%=order.getoID()%> style="display:none">
	           <input type="submit" width="100" value="发货" name="submit" onclick="alert('发货成功')"  			
	           style="background: url('${pageContext.request.contextPath}/Reception/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); 
				height: 35px; width: 100px; color: white;">
           </form>
           </td>
         </tr>
         <%}%>
       </table>
       </div>
</body>
</html>