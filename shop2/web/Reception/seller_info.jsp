<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家页面</title>
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
	background: url(https://buff.163.com/static/images/site/user-bg.png)
		no-repeat left top;
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

.content .content-left .honest {
	width: 100%;
	height: 40%;
	border: 1px solid #ccc;
	color: #fff;
	background: url(https://buff.163.com/static/images/site/user-bg.png)
		no-repeat left top;
}

.content .content-right {
	width: 80%;
	float: left;
}

.content .content-right .header-info {
	height: 60px;
	border: 1px solid #ccc;
}

.content .content-right .header-info .search {
	float: right;
	width: 30%;
	height: 38px;
	margin-top: 18px;
}

.content .content-right .good-list {
	width: 96%;
	margin: 10px 20px 0px 10px;
}

.content .content-right .good-list .good-single {
	width: 25%;
	height: 200px;
	float: left;
}

.content .content-right .good-list .good-single .good-pic {
	width: 100%;
	height: 150px;
}

.content .content-right .good-list .good-single .good-name {
	width: 100%;
	height: 50px;
	white-space: nowrap;
	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-left: 5px;
	font-size: 10px;
}

.content .content-right .good-list .good-single .good-name a {
	color: #778899;
	ext-decoration: none;
}

.content .content-right .good-list .good-single .good-name a:hover {
	color: #000;
}
</style>

</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="content">
		<div class="content-left">
			<div class="seller-info">
			<span>商家信息：</span>
				<div class="head-pic">
				<img src="${seller.headPic }" style="width:120px;height:120px;" />
				</div>
				<div class="seller-name">
				<span>${seller.userName }</span>
				</div>
			</div>
			<div class="honest">
				<span>商家诚信值:${seller.honest }</span>
			</div>
		</div>
		<div class="content-right">
			<div class="header-info">
			<span>在售商品：</span>
				<div class="search">
				  <form style="width:240px;height:30px;">
					<div style="width:180px;height:30px;float:left;">
						
					</div>
					<div style="float:left;width:50px;height:30px;">
						
					</div>
				  </form>
				</div>
			</div>
			<div class="good-list">
				<c:forEach items="${goodsList}" var="goods">
					<div class="good-single">
						<div class="good-pic" >
						<a href="${pageContext.request.contextPath}/goodsServlet?method=goodsInfo&gId=${goods.gID}">
							<img src="${pageContext.request.contextPath}/${goods.gPic }" style="width:85%;height:150px;"></a>
						</div>
						<div class="good-name">
						<a href="${pageContext.request.contextPath}/goodsServlet?method=goodsInfo&gId=${goods.gID}">
							${goods.gName}</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>