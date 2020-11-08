<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<!-- 引入表单校验jquery插件 -->
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/code.js" type="text/javascript"></script>
<script src="js/lhgcore.lhgdialog.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

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

.error{
	color:red
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
	xmlhttp.open("GET","ajax/checkName.jsp?key="+key,false);
	xmlhttp.send();
}
</script>

</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>用户注册</font>USER REGISTER
				<form id="myform" class="form-horizontal" action="${pageContext.request.contextPath}/user?method=regist" method="post" style="margin-top: 5px;">
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="userName" name="userName"
								placeholder="请输入用户名(不少于6位)" onblur="checkUser(myform.userName);">
						</div><label id="result" name="result"></label>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="userPwd" name="userPwd"
								placeholder="请输入密码(不少于6位)">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="repassword" name="repassword"
								placeholder="请再次输入密码">
						</div>
					</div>
					
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">昵称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="nickName" name="nickName"
								placeholder="请输入昵称">
						</div>
					</div>

					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="phone" name="phone"
								placeholder="请输入手机号">
						</div>
					</div>
				   <div class="form-group">
						<label for="IDNum" class="col-sm-2 control-label">身份份证号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="IDNum" name="IDNum"
								placeholder="请输入身份证号">
						</div>
					</div>
						
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="checkCode" id="checkCode"
							placeholder="请输入验证码">
						</div>
						<div class="col-sm-2">
							<div id="v_container" style="width: 100px;height: 40px;"></div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" value="注册" width="100" id="go" name="go"
								style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

<script>
var verifyCode = new GVerify("v_container");
document.getElementById("go").onclick = function(){
    var res = verifyCode.validate(document.getElementById("checkCode").value);
    if(res){
    	if (document.getElementById("nickName").value==""){
    	    alert('内容未填写完整!');
    	    return false;
   		}if (document.getElementById("userName").value.length < 6 ||document.getElementById("userName").value.length > 15){
    	    alert('用户名长度不符!');
    	    return false;
   		}if(document.getElementById("userPwd").value.length < 6 ||document.getElementById("userPwd").value.length > 15){
   			alert('密码长度不符!');
   			return false;
   		}if(document.getElementById("userPwd").value!=document.getElementById("repassword").value){
   			alert('两次密码不同!');
   			return false;
   		}if(document.getElementById("IDNum").value.length!=18){
   			alert('身份证长度不符!');
   			return false;
   		}if(document.getElementById("phone").value.length!=11){
   			alert('手机号长度不符!');
   			return false;
   		}else
   			$("#myform").submit();

    }else{
        alert("验证码错误");
        return false;
    }
}
</script>

</body>
</html>




