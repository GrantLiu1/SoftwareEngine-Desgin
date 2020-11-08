<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="com.shop.dao.UserDao,com.shop.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
	<link rel="stylesheet" type="text/css" href="../css/main-middle.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</head>
<script>
    function searchUser(){
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
	       document.getElementById("UserList").innerHTML=xmlhttp.responseText;
	    }
	  }
	  xmlhttp.open("GET","../ajax/searchUser.jsp?key="+key,false);
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
 		    xmlhttp.open("GET","../ajax/deleteUser.jsp?key="+key,false);
 		  	xmlhttp.send();  
 			$("#dialogDelete").dialog( "open" );
 		});
    	 $(document).on('click', '.cancel', function () {
    		 $("#dialogDelete").dialog( "close" );
    	 });
 	 });
    
    function close(){
    	$("#dialogDelete").dialog({
    		onClose: function() {
                //局部刷新id='login'的内容
            }
        });
  	}
</script>

<body>
 <div id="top">
    	<div id="top-letf">用户列表</div>
    </div>
    <div id="middle">
        <input name="key_code" type="text" id="key_code" placeholder="请输入用户编码" class="textfild">
	    <button class="btn" onClick="searchUser()">查找用户</button>
     <table id="UserList" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;">
         <tr>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">用户编码</td>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">用户帐号</td>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">用户头像</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">用户昵称</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">用户身份</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">身份证号</td>
           <td width="150" height="35" align="center" valign="middle" bgcolor="#DDD">手机号</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">慈善金</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">诚信点</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">申请卖家</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">操作</td>
         </tr>
  		 <%
            UserDao userDaoImpl=new UserDao();
            List<User> list=userDaoImpl.selectAllUser();   
            for(User user:list)
         {%>
         <tr>
           <td width="150" height="40" align="center" valign="middle"><%=user.getUserID()%></td>
           <td width="150" height="40" align="center" valign="middle"><%=user.getUserName()%></td>
           <td width="150" height="40" align="center" valign="middle"><img src=${pageContext.request.contextPath}<%="/"+user.getHeadPic()%> style="width: 100px;height: 100px;margin:5px"/></td>
           <td width="100" height="40" align="center" valign="middle"><%=user.getNickName()%>
           <td width="100" height="40" align="center" valign="middle"><%=user.isUserType()%></td>
           <td width="200" height="40" align="center" valign="middle"><%=user.getIDNum()%></td>
           <td width="150" height="40" align="center" valign="middle"><%=user.getPhone()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=user.getCharity()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=user.getHonest()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=user.isuCheck()%></td>
           <td width="100" align="center" valign="middle">
   		     <button class="btn-delete">删除</button>
           </td>
         </tr>
         <%}%>
       </table>
	</div>
	<div id="dialogDelete" title="是否确认删除?"  style="display:none">
		<form action="${pageContext.request.contextPath}/user?method=delUser_admin" method="post" style="text-align:center">
			<div id="delete" align="center"></div>
			<input type="submit" value="确定">
			<input type="button" class="cancel" style="margin-right:10px" value="取消">
		</form>
	</div>
</body>
</html>