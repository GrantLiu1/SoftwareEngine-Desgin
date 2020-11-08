<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<!-- 引入表单校验jquery插件 -->
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/code.js" type="text/javascript"></script>
<script src="js/lhgcore.lhgdialog.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="../Reception/css/style.css" type="text/css" />
<link rel="stylesheet" href="../Reception/css/bootstrap.min.css" type="text/css" />
<%@ page import="com.shop.entity.User"%>

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}

</style>

<script type="text/javascript">
function checkUser(username) { 
	if (username.value == "") {
		username.focus(); 
		return; 
	} else { 
		createRequest(); 
	} 
}

function createRequest() {
	var xmlhttp; 
	var key=document.getElementById("userName").value;
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
	     document.getElementById("result").innerHTML=xmlhttp.responseText;
	  }
	}
	xmlhttp.open("GET","checkName.jsp?key="+key,false);
	xmlhttp.send();
}
</script>

</head>
<body>	
		<jsp:include page="../sellerHeader.jsp"></jsp:include>

	  	<%
	 	   	User user = (User) session.getAttribute("user");
        %>

	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>我的信息</font>USER INFORMATION
				
				<form id="myform" name="myform"  method="post" enctype="multipart/form-data">
				<br>
				
				<table style="table td:font-family:黑体;
							 margin-left: 150px">
			    <tr>
			      <th width="165" height="80" style="text-align: center; scope="col">
			      		<img src="${pageContext.request.contextPath}/${user.headPic}" style="width:120px;height:120px; border-radius: 60px;"/>
			      </th>
			      <th width="625" height="80" style="text-align: left;">
			      		<input type="file" name="spic" id="spic">
			      </th>

			    <tr>
			      <td height="60" width="10" align="center" valign="middle" style="font-family:Simsun;font-weight:bold;">用户名</td>
			      <td height="60">${user.userName }</td>
			    </tr>
			    <tr>
			      <td height="60" align="center" valign="middle" style="font-family:Simsun;font-weight:bold;">昵称</td>
			      <td height="60"><input type="text" name="nickName" id="nickName" value="${user.nickName }" style="font-size: 16px;"></td>
			    </tr>
			    <tr>
			      <td height="60" align="center" valign="middle" style="font-family:Simsun;font-weight:bold;">身份证</td>
			      <td height="60">${user.IDNum }</td>
			    </tr>
			    <tr>
			      <td height="60" align="center" valign="middle" style="font-family:Simsun;font-weight:bold;">手机号</td>
			      <td height="60"><input type="text" name="phone" id="phone" value="${user.phone }" style="font-size: 16px;"></td>
			    </tr>

			    <tr>
			      <td height="60" align="center" valign="middle"style="font-family:Simsun;font-weight:bold;">身份</td>
			      <td height="60">
			      	已认证卖家身份
			      </td>
			    </tr>
			    <tr>
			      <td height="100">&nbsp;</td>
			      <td height="100" style="text-align: right;">
				 <input type="submit" value="确认修改" class="btn" id="go" name="go" 
					style="height: 35px; width: 100px;">
					</td>
			    </tr>
			</table>
				</form>
				<form>
			<table>
			<tr>
			<TH width="10%"
			style="white-space: nowrap; text-align: center; color: green"><SPAN>${message}</SPAN></TH>
			</tr>
			</table>
			
			</form> 
			</div>

			<div class="col-md-2"></div>
			<!-- onclick="alert('修改成功')" -->
			<script type="text/javascript">
			document.getElementById("go").onclick = function(){
			var img = document.getElementById("spic");
				var imgFile = img.files[0];
				var imgStr = /\.(jpg|jpeg|png|bmp|BMP|JPG|PNG|JPEG)$/;
				if (document.getElementById("phone").value.length!=11){
			   	    alert('手机号长度不符!');
			   	    return false;
			  	}else if(img.value){
			  		if (!imgStr.test(imgFile.name)){
						alert("上传的广告图片不是图片格式!");
						return false;
					}else{
			   			document.getElementById("myform").action="${pageContext.request.contextPath}/user?method=seller_updateHeadPic"	
			   			document.getElementById("myform").submit();
			   			alert('修改成功');
					}
		   		}else{
		   			alert('修改信息成功');
					document.getElementById("myform").action="${pageContext.request.contextPath}/user?method=seller_update_info"	
					document.getElementById("myform").submit();
		  		} 
			}
			</script>
		</div>
	</div>


</body>
</html>




