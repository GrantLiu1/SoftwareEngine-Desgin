<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.shop.dao.AddressDao,com.shop.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的地址</title>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<style type="text/css">
.btn-del,.btn-upd{
	width:70px; 
	height:30px; 
	color: white; 
	text-align:center;
	font-size:12px;
	background-color:#666;
	cursor:pointer;
	border:none;
	border-radius:2px;
	margin-left:10px;
	float:left;
}

.btn,.btn-new{
	width:90px; 
	height:38px; 
	color: white; 
	text-align:center;
	font-size:14px;
	background-color:#555;
	cursor:pointer;
	white-space:nowrap;
	display:inline-block;
	border:none;
	border-radius:2px;
	margin:8px;
}
</style>
<script>
function check() {
	if(document.getElementById("address").value==""){
		alert('地址不能为空!');
		return false;
	}else
		return true;
}

$(function() {
 	$("#dialog_1").dialog({
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
    
 	$("#dialog_2").dialog({
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
 	
    $(".btn-new").click(function() {
		$("#dialog_1").dialog( "open" );
	});
    
    $(".btn-upd").click(function() {
    	var xmlhttp; 
	  	var key=$(this).next().children().first().next().val();
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
	    xmlhttp.open("GET","ajax/updAddress.jsp?key="+key,true);
	  	xmlhttp.send();
		$("#dialog_2").dialog( "open" );
	});
 });
</script>
</head>

<body style="margin:0px; padding:0px; background-color: #FFF">
	<input type="button" class="btn-new" value="新增地址">
	<table width="100%" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid;">
      <tr>
        <td width="250" height="50" align="center" valign="middle" bgcolor="#DDD">地址详情</td>
        <td width="40" height="50" align="center" valign="middle" bgcolor="#DDD">操作</td>
      </tr>
      <% AddressDao dao=new AddressDao();
      	 User user = (User) session.getAttribute("user");
         List<Address> list=dao.selectUserAddress(user.getUserID());   
         for(Address address:list) 
      {%>
      <tr>
        <td width="250" height="40" align="center" valign="middle"><%=address.getaContent() %></td>
        <td width="40" height="40" align="center" valign="middle">
        	<input type="button" class="btn-upd" value="修改地址">
        	<form style="margin: 0px;padding: 0px;" action="${pageContext.request.contextPath}/addressServlet?method=delAddress" method="post"> 
            	<input type="submit" class="btn-del" value="删除地址">
            	<input type="text" name="key" id="key" value=<%=address.getaID()%> style="display:none;">
            </form>
        </td>
      </tr>
      <%}%>
    </table>
</body>

<div id="dialog_1" title="添加地址">
	<form action="${pageContext.request.contextPath}/addressServlet?method=newAddress" method="post" onSubmit="return check()">
		<table border="0">
		  <tr>
		    <td width="100" height="30" align="right" valign="top">地址详情：</td>
		    <td width="300" height="30" valign="middle">
		    	<textarea name="address" id="address" style="width: 300px; height: 50px;"></textarea>
		    </td>
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

<div id="dialog_2" title="修改地址">
	<form action="${pageContext.request.contextPath}/addressServlet?method=updAddress" method="post">
		<table border="0">
		  <tr>
		    <td width="100" height="30" align="right" valign="top">地址详情：</td>
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

</html>