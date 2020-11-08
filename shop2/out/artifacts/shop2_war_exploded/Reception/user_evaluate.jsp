<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.shop.dao.*,com.shop.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的评价</title>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<style type="text/css">
.btn-upd,.btn-del{
	width:70px; 
	height:30px; 
	color: white; 
	text-align:center;
	font-size:12px;
	background-color:#666;
	cursor:pointer;
	border:none;
	border-radius:2px;
	margin-left:5px;
	float: left;
}
.btn{
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
	    xmlhttp.open("GET","ajax/updEvaluate.jsp?key="+key,true);
	  	xmlhttp.send();
		$("#dialog").dialog( "open" );
	});
 });
</script>
</head>

<body style="margin:0px; padding:0px; background-color: #FFF">
	<table width="100%" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid;">
	  <tr>
	    <td width="100" height="50" align="center" valign="middle" bgcolor="#DDD">商品名</td>
	    <td width="200" height="50" align="center" valign="middle" bgcolor="#DDD">评价内容</td>
	    <td width="100" height="50" align="center" valign="middle" bgcolor="#DDD">评价时间</td>
	    <td width="100" height="50" align="center" valign="middle" bgcolor="#DDD">操作</td>
	  </tr>
	  <% EvaluationDao dao=new EvaluationDao();
	  	 GoodsDao goodsDao=new GoodsDao();
      	 User user = (User) session.getAttribute("user");
         List<Evaluations> list=dao.selectEvaluationsByuserID(user.getUserID());   
         for(Evaluations eva:list){
        	 Goods goods=goodsDao.findGoodById(eva.getgID());
      %>
	  <tr>
	    <td width="100" height="40" align="center" valign="middle"><label><%=goods.getgName()%></label></td>
	    <td width="200" height="40" align="center" valign="middle"><%=eva.geteContent()%></td>
	    <td width="100" height="40" align="center" valign="middle"><%=eva.geteTime()%></td>
	    <td width="100" height="40" align="center" valign="middle">
	    	<input type="button" class="btn-upd" value="修改评价"> 
	        <form style="margin: 0px;padding: 0px;" action="${pageContext.request.contextPath}/evaluation?method=delEva" method="post"> 
            	<input type="submit" class="btn-del" value="删除评价">
            	<input type="text" name="key" id="key" value=<%=eva.geteID()%> style="display:none;">
            </form> 
	    </td>
	  </tr>
	  <%}%>
	</table>
	
	<div id="dialog" title="修改评价">
		<form action="${pageContext.request.contextPath}/evaluation?method=updEva" method="post">
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