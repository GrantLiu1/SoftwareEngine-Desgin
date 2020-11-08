<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的收藏</title>
<style type="text/css">
.btn{
	width:70px; 
	height:30px; 
	color: white; 
	text-align:center;
	font-size:12px;
	background-color:#666;
	cursor:pointer;
	border:none;
	border-radius:2px;
	margin:1px;
}

.good-list {
	width: 96%;
	margin: 10px 20px 0px 10px;
}

.good-single {
	width: 25%;
	height: 200px;
	float: left;
}

.good-pic {
	width: 100%;
	height: 150px;
}

.good-name {
	width: 100%;
	height: 50px;
	white-space: nowrap;
	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-left: 5px;
	font-size: 10px;
}

.good-name a {
	color: #778899;
	ext-decoration: none;
}
</style>
</head>

<body style="margin:0px; padding:0px; background-color: #FFF">
	<div class="good-list">
		<c:forEach items="${goodsList}" var="goods">
			<div class="good-single">
				<div class="good-pic" >
				<a href="${pageContext.request.contextPath}/goodsServlet?method=goodsInfo&gId=${goods.gID}" target="_parent">
					<img src="${pageContext.request.contextPath}/${goods.gPic }" style="width:85%;height:150px;"></a>
				</div>
				<div class="good-name">
				<a href="${pageContext.request.contextPath}/goodsServlet?method=goodsInfo&gId=${goods.gID}" target="_parent">
					${goods.gName}</a>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>