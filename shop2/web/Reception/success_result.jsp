<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/style.css" type="text/css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div style="width: 100%; height: 300px">
		<div
			style="width: 500px; height: 50px; margin-top: 180px; margin-left: 500px">
			<img alt=""
				src="${pageContext.request.contextPath}/Reception/img/nocart.png">
			<span>您已完成订购，请静候卖家发货!<a
				href="${pageContext.request.contextPath}/index?method=index">继续购物</a>
			</span>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>