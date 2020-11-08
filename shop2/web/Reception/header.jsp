<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="${pageContext.request.contextPath}/Reception/img/logo2.png" style="width: 240px; height: 60px;"/>
	</div>
	<div class="col-md-4">
		<img src="${pageContext.request.contextPath}/Reception/img/header.png" />
	</div>
	<div class="col-md-4" style="padding-top:20px">
		<ol class="list-inline">
		<c:if test="${empty user}">
			<li><a href="${pageContext.request.contextPath}/Reception/login.jsp">登录</a></li>
			<li><a href="${pageContext.request.contextPath}/Reception/register.jsp">注册</a></li>
		</c:if>
		<c:if test="${!empty user}">
			<li>欢迎您,${user.nickName},<a href="${pageContext.request.contextPath}/user?method=exit">退出登录</a></li>
		</c:if>
			<li><a href="${pageContext.request.contextPath}/cart?method=showMyCart">购物车</a></li>
			<li><a href="${pageContext.request.contextPath}/Reception/myhome.jsp">我的主页</a></li>
		</ol>
	</div>
	
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index?method=index">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKindName&kindName=shuma&currentPage=1">数码家电<span class="sr-only"></span></a></li>
					<li><a href="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKindName&kindName=baihuo&currentPage=1">日用百货</a></li>
					<li><a href="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKindName&kindName=yifu&currentPage=1">潮牌衣柜</a></li>
					<li><a href="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKindName&kindName=jiushui&currentPage=1">零食酒水</a></li>
					<li><a href="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKindName&kindName=shuiguo&currentPage=1">生鲜蔬果</a></li>
					<li><a href="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKindName&kindName=book&currentPage=1">图书娱乐</a></li>
					<li><a href="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKindName&kindName=house&currentPage=1">装修家具</a></li>
				</ul>
				<form class="navbar-form navbar-right" style="width:400px" role="search" action="${pageContext.request.contextPath}/goodsServlet?method=findGoodListByKeyWord&currentPage=1" method="post">
					<div class="form-group" style="width:300px">
						<input type="text" class="form-control" placeholder="请输入商品名称" name="keyWord" value="${keyWord }" style="width:300px">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
		</div>
	</nav>
</div>