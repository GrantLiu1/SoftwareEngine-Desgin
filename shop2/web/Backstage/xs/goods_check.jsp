<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="com.shop.dao.GoodsDao,com.shop.entity.Goods"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <title>待审核商品列表</title>
    <link rel="stylesheet" type="text/css" href="../css/main-middle.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script>
    
    function searchGoods(){
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
	       document.getElementById("GoodsList").innerHTML=xmlhttp.responseText;
	    }
	  }
	  xmlhttp.open("GET","../ajax/searchAimGoods.jsp?key="+key,false);
	  xmlhttp.send();
	}
    
    $(function() {
    	$("#dialogProve").dialog({
	      height: 100,
	      width: 180,
	      resizable: false,
	      modal: true,
	      autoOpen: false,
	      show: {
	        effect: "clip",
	        duration: 200
	      },
	    });
  
    	 $(document).on('click', '.btn-prove', function () {
 	    	var xmlhttp; 
 		  	var key=$(this).parent().parent().children().first().text().trim(); 
 		  	console.log("gId:"+key);
 		  	if (window.XMLHttpRequest){
 		    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
 		    	xmlhttp=new XMLHttpRequest();
 		  	}
 		  	else{
 		    	 //IE6, IE5 浏览器执行代码
 		    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
 		  	}
 		  	xmlhttp.onreadystatechange=function(){
		    	if (xmlhttp.readyState==4 && xmlhttp.status==200){
		       		document.getElementById("prove").innerHTML=xmlhttp.responseText;
		    	}
		  	}
 		    xmlhttp.open("GET","../ajax/proveGoods.jsp?key="+key,false);
 		  	xmlhttp.send();  
 			$("#dialogProve").dialog( "open" );
 		});
    	 $(document).on('click', '.cancel1', function () {
    		 $("#dialogProve").dialog( "close" );
    	 });
 	 });
   		$(function() {
    	$("#dialogCancel").dialog({
	      height: 100,
	      width: 180,
	      resizable: false,
	      modal: true,
	      autoOpen: false,
	      show: {
	        effect: "clip",
	        duration: 200
	      },
	    });
  
    	 $(document).on('click', '.btn-cancel', function () {
 	    	var xmlhttp; 
 		  	var key=$(this).parent().parent().children().first().text().trim(); 
 		  	if (window.XMLHttpRequest){
 		    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
 		    	xmlhttp=new XMLHttpRequest();
 		  	}
 		  	else{
 		    	 //IE6, IE5 浏览器执行代码
 		    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
 		  	}
 		  	xmlhttp.onreadystatechange=function(){
		    	if (xmlhttp.readyState==4 && xmlhttp.status==200){
		       		document.getElementById("cancel").innerHTML=xmlhttp.responseText;
		    	}
		  	}
 		    xmlhttp.open("GET","../ajax/cancelGoods.jsp?key="+key,false);
 		  	xmlhttp.send();  
 		  	
 			$("#dialogCancel").dialog( "open" );
 		});
    	 
    	 $(document).on('click', '.cancel2', function () {
    		 $("#dialogCancel").dialog( "close" );
    	 });
 	 }); 
    
	</script>
  </head>
  
<body>
    <div id="top">
    	<div id="top-letf">商品发布审核列表</div>
    </div>
    <div id="middle">
        <input name="key_code" type="text" id="key_code" placeholder="请输入商品码" class="textfild">
	    <button class="btn" onClick="searchGoods()">查找商品</button>
     <table id="GoodsList" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;">
         <tr>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">商品码</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品名</td>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">商品种类</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品图片</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品库存</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品单价</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">操作</td>
         </tr>
  		 <%
            GoodsDao goodsDaoImpl=new GoodsDao();
            List<Goods> list=goodsDaoImpl.selectPublishGoods();
            for(Goods goods:list)
         {%>
         <tr>
           <td width="150" height="40" align="center" valign="middle"><%=goods.getgID()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=goods.getgName()%></td>
           <td width="150" height="40" align="center" valign="middle"><%=goods.getgKind()%></td>
           <td width="100" height="40" align="center" valign="middle"><img src=${pageContext.request.contextPath}<%="/"+goods.getgPic()%> style="width: 100px;height: 100px;margin:5px"/></td>
           <td width="100" height="40" align="center" valign="middle"><%=goods.getgAmount()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=goods.getgPrice()%></td>
           <td width="200" align="center" valign="middle">
   		     <button class="btn-prove">通过</button>
   		     <button class="btn-cancel">拒绝</button>
           </td>
         </tr>
         <%}%>
       </table>
	</div>
	
	<div id="dialogProve" title="是否确认通过?" style="display:none">
		<form action="${pageContext.request.contextPath}/goodsServlet?method=proveGoods_admin" method="post" style="text-align:center">
			<div id="prove" align="center"></div>
			<input type="submit" value="确定">
			<input type="button" class="cancel1" style="margin-right:10px" value="取消">
		</form>
	</div>
	
	<div id="dialogCancel" title="是否确认拒绝?" style="display:none">
		<form action="${pageContext.request.contextPath}/goodsServlet?method=cancelGoods_admin" method="post" style="text-align:center">
			<div id="cancel" align="center"></div>
			<input type="submit" value="确定">
			<input type="button" class="cancel2" style="margin-right:10px" value="取消">
		</form>
	</div>

</body>
</html>
