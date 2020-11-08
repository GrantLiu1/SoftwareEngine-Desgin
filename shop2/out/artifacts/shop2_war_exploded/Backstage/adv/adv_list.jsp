<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="com.shop.dao.IndexDao,com.shop.entity.Indexs"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广告列表</title>
	<link rel="stylesheet" type="text/css" href="../css/main-middle.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</head>
<script>
    function searchComplaints(){
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
	       document.getElementById("IndexList").innerHTML=xmlhttp.responseText;
	    }
	  }
	  xmlhttp.open("GET","../ajax/searchIndex.jsp?key="+key,false);
	  xmlhttp.send();
	}
    
    $(function() {
    	$("#dialogDeal").dialog({
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
  
    	 $(document).on('click', '.btn-deal', function () {
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
		       		document.getElementById("deal").innerHTML=xmlhttp.responseText;
		    	}
		  	}
 		    xmlhttp.open("GET","../ajax/dealComplaints.jsp?key="+key,false);
 		  	xmlhttp.send();  
 			$("#dialogDeal").dialog( "open" );
 		});
 	 });
    
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
 		    xmlhttp.open("GET","../ajax/deleteIndex.jsp?key="+key,false);
 		  	xmlhttp.send();  
 			$("#dialogDelete").dialog( "open" );
 		});
    	 
    	 $(document).on('click', '.cancel', function () {
    		 $("#dialogDelete").dialog( "close" );
    	 });
 	 });
</script>

<body>
 <div id="top">
    	<div id="top-letf">广告列表</div>
    </div>
    <div id="middle">
        <input name="key_code" type="text" id="key_code" placeholder="请输入广告编码" class="textfild">
	    <button class="btn" onClick="searchComplaints()">查找广告</button>
     <table id="IndexList" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;">
         <tr>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">广告编码</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">广告标题</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">广告副标题</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">广告图片</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">图片链接</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">广告类别</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">操作</td>
         </tr>
  		 <%
  		 	IndexDao indexDaoImpl = new IndexDao();
  		   		             List<Indexs> list=indexDaoImpl.selectAllAdvs();
  		   		             for(Indexs index:list)
  		   		          {
  		 %>
         <tr>
           <td width="100" height="40" align="center" valign="middle"><%=index.getiID()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=index.getiName()%></td>
           <td width="200" height="40" align="center" valign="middle"><%=index.getiSName()%></td>
           <td width="100" height="40" align="center" valign="middle"><img src=${pageContext.request.contextPath}<%="/"+index.getiPic()%> style="width: 100px;height: 100px;margin:5px"/></td>
           <td width="100" height="40" align="center" valign="middle"><%=index.getiUrl()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=index.getiKind()%></td>
           <td width="100" align="center" valign="middle">
   		     <button class="btn-delete">删除</button>
           </td>
         </tr>
         <%}%>
       </table>
	</div>

	<div id="dialogDelete" title="是否确认删除?" style="display:none">
		<form action="${pageContext.request.contextPath}/index?method=delPage_admin" method="post" style="text-align:center">
			<div id="delete" align="center"></div>
			<input type="submit" value="确定">
			<input type="button" class="cancel" style="margin-right:10px" value="取消">
		</form>
	</div>
</body>
</html>