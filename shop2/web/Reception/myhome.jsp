<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/style.css" type="text/css" />
<style type="text/css">
.content {
	width: 1000px;
}

.content .content-left {
	width: 19%;
	height: 600px;
	float: left
}

.content .content-left .seller-info {
	width: 100%;
	height: 40%;
	border: 1px solid #ccc;
	background-color:#222;
	color: #fff;
}

.content .content-left .seller-info .head-pic {
	width: 120px;
	height: 120px;
	margin-top: 30px;
	margin-left: 35px;
}

.content .content-left .seller-info .seller-name {
	width: 120px;
	height: 36px;
	margin: auto;
	font-size: 20px;
	text-align: center;
	color: #fff;
}

.content .content-left .user-option {
	width: 100%;
	height: 40%;
	border: 1px solid #ccc;
	color: #fff;
	background-color:#222;
	padding-top: 20px;
}
.content .content-left .user-option ul li{
	color:#EEE;
	margin-top:10px;
	list-style-type:none;
}
.content .content-right {
	width: 80%;
	float: left;
}
</style>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<c:if test="${empty user}">
		<% response.sendRedirect(request.getContextPath()+"/Reception/login.jsp");%>
	</c:if>
	<c:if test="${!empty user}">
		<div class="container" style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="content">
			<div class="content-left">
				<div class="seller-info">
				<span>用户信息：</span>
					<div class="head-pic">
						<a href="${pageContext.request.contextPath}/Reception/edit_headpic.jsp" target="info">
						<img src="${pageContext.request.contextPath}/${user.headPic }" style="width:120px;height:120px; border-radius: 60px;"/></a>
					</div>
					<div class="seller-name">
					<span>${user.userName }</span>
					</div>
				</div>
				<div class="user-option">
					<ul>
						<a href="user_info.jsp" target="info" style="text-decoration: none;"><li>个人信息</li></a>
						<a href="user_order.jsp" target="info" style="text-decoration: none;"><li>我的订单</li></a>
						<a href="user_evaluate.jsp" target="info" style="text-decoration: none;"><li>我的评价</li></a>
						<a href="${pageContext.request.contextPath }/store?method=findStoreByUser" target="info" style="text-decoration: none;"><li>我的收藏</li></a>
						<a href="user_complain.jsp" target="info" style="text-decoration: none;"><li>我的投诉</li></a>
						<a href="user_address.jsp" target="info" style="text-decoration: none;"><li>我的地址</li></a>
					</ul>
				</div>
			</div>
			<div class="content-right">
				<iframe src="${pageContext.request.contextPath }/Reception/user_info.jsp" name="info" style="width:800px;height:650px;margin-bottom: 10px">
				</iframe>
			</div>
		</div>
		</div>
	</c:if>
	
	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>