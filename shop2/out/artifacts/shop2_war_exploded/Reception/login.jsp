<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/code.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/lhgcore.lhgdialog.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.container .row div {
	/* position:relative;
				 float:left; */
	
}

font {
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
}
</style>
</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>


	<div class="container"
		style="width: 100%; height: 460px; background: #34cbdb url('${pageContext.request.contextPath}/Reception/images/loginbg.png') no-repeat;">
		<div class="row">
			<div class="col-md-7"></div>
			<div class="col-md-5">
			<div style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
				<font>用户登录</font>USER LOGIN
				<div>&nbsp;</div>
				<form id="myform" class="form-horizontal" action="${pageContext.request.contextPath}/user?method=login" method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="code1" name="code1"
								placeholder="验证码">
						</div>
						<div class="col-sm-3">
							<div id="v_container" style="width: 100px;height: 40px;"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox" name="autoLogin" id="autoLogin" value="true"> 自动登录
								</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<label> 
									<input type="checkbox" id="seller" name="seller" value="true"> 卖家登录
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="登录" id="go" name="go"
								style="background: url('${pageContext.request.contextPath}/Reception/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

<script>
var verifyCode = new GVerify("v_container");
document.getElementById("go").onclick = function(){
    var res = verifyCode.validate(document.getElementById("code1").value);
    if(res){
    	if (document.getElementById("userName").value==""||document.getElementById("userPwd").value==""){
        	alert('账号或密码不能为空!');
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