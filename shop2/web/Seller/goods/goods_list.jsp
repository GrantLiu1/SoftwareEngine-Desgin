<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="com.shop.dao.GoodsDao,com.shop.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="../css/main-middle.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
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
	  xmlhttp.open("GET","searchGoods.jsp?key="+key,false);
	  xmlhttp.send();
	}
    
    $(function() {
    	$("#dialogDelete").dialog({
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
  
    	 $(document).on('click', '.btn-delete', function () {
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
		       		document.getElementById("delete").innerHTML=xmlhttp.responseText;
		    	}
		  	}
 		    xmlhttp.open("GET","deleteGoods.jsp?key="+key,false);
 		  	xmlhttp.send();  
 			$("#dialogDelete").dialog( "open" );
 		});
    	 $(document).on('click', '.cancel', function () {
    		 $("#dialogDelete").dialog( "close" );
    	 });
 	 });
    
    $(function() {
    	 $(document).on('click', '.btn-change', function () {
 	    	var xmlhttp; 
 		  	var key=$(this).parent().parent().children().first().text().trim(); 
 		  	console.log(key);
 		  	if (window.XMLHttpRequest){
 		    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
 		    	xmlhttp=new XMLHttpRequest();
 		  	}
 		  	else{
 		    	 //IE6, IE5 浏览器执行代码
 		    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
 		  	}
 		  	window.location.href="updateGood.jsp?gId="+key+"";
 		});
 	 });
    
    $(function() {
    	$("#dialogEva").dialog({
	      height: 300,
	      width: 550,
	      resizable: false,
	      modal: true,
	      autoOpen: false,
	      show: {
	        effect: "clip",
	        duration: 200,
	      },
	    });
  
    	 $(document).on('click', '.btn-eva', function () {
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
		       		document.getElementById("select").innerHTML=xmlhttp.responseText;
		    	}
		  	}
 		    xmlhttp.open("GET","selectEvas.jsp?key="+key,false);
 		  	xmlhttp.send();  
 			$("#dialogEva").dialog( "open" );
 		});
 	 });
    
	</script>
  </head>
  
<body>
    <jsp:include page="../sellerHeader.jsp"></jsp:include>
    <div  style="text-align:center;height: 100%;background: url('${pageContext.request.contextPath}/Seller/images/regist_bg.jpg');">
 
        <input name="key_code" type="text" id="key_code" placeholder="请输入商品码" class="textfild">
	    <button class="btn" onClick="searchGoods()">查找商品</button>
     <table id="GoodsList" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid; margin:auto;margin-top:10px;">
         <tr>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品码</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品名</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品种类</td>
           <td width="120" height="35" align="center" valign="middle" bgcolor="#DDD">商品描述</td>
           <td width="120" height="35" align="center" valign="middle" bgcolor="#DDD">商品图片</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品库存</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品单价</td>
<%--           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">慈善金</td>--%>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品状态</td>
           <td width="300" height="35" align="center" valign="middle" bgcolor="#DDD">操作</td>
         </tr>
  		 <%
	  		User user = (User) session.getAttribute("user");
            GoodsDao goodsDaoImpl=new GoodsDao();
            List<Goods> list=goodsDaoImpl.selectSellerGoods(user.getUserID());
            for(Goods goods:list)
         {%>
         <tr>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=goods.getgID()%></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=goods.getgName()%></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=goods.getgKind()%></td>
           <td bgcolor="white" width="200" height="40" align="center" valign="middle"><img src=${pageContext.request.contextPath}<%="/"+goods.getgDes()%> style="width: 100px;height: 100px;margin:5px"/></td>
           <td bgcolor="white" width="200" height="40" align="center" valign="middle"><img src=${pageContext.request.contextPath}<%="/"+goods.getgPic()%> style="width: 100px;height: 100px;margin:5px"/></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=goods.getgAmount()%></td>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=goods.getgPrice()%></td>
<%--           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=goods.getgChar()%></td>--%>
           <td bgcolor="white" width="100" height="40" align="center" valign="middle"><%=goods.isgCheck()%></td>
           <td bgcolor="white" width="300" align="center" valign="middle">
           	 <button class="btn-change">修改</button>
   		     <button class="btn-delete">删除</button>
   		     <button class="btn-eva">评价</button>
           </td>
         </tr>
         <%}%>
       </table>

	<div id="dialogDelete" title="是否确认删除?" style="display:none">
		<form action="${pageContext.request.contextPath}/goodsServlet?method=deleteGoods_seller" method="post" style="text-align:center">
			<div id="delete" align="center"></div>
			<input type="submit" value="确定">
			<input type="button" class="cancel" style="margin-right:10px" value="取消">
		</form>
	</div>
	
	<div id="dialogEva" title="商品评价" style="display:none">
		<div id="select" align="center"></div>
	</div>
</div>
	
	
</body>
</html>
