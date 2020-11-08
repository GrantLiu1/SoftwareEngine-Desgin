<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商城首页</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js" type="text/javascript"></script>
		<style type="text/css">
			label{
				overflow : hidden;
			    text-overflow: ellipsis;
			    display: -webkit-box;
			    -webkit-line-clamp: 2;
			    -webkit-box-orient: vertical;
			}
		</style>
	</head>

	<body>
			<!-- 引入header.jsp -->
			<jsp:include page="header.jsp"></jsp:include>
		<div class="container-fluid" style="width:85%">
		<!-- 轮播图 -->
		<div class="container-fluid">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- 轮播图的中的小点 -->
				<ol class="carousel-indicators">
					<c:forEach items="${bigPic }" var="pic" varStatus="status">
						<li data-target="#carousel-example-generic"
							data-slide-to="${status.index}"
							class="<c:if test="${status.index==0}">active</c:if>"></li>
					</c:forEach>
				</ol>
				<!-- 轮播图的轮播图片 -->
				<div class="carousel-inner" role="listbox">
					<c:forEach items="${bigPic }" var="pic" varStatus="status">
						<div class="item <c:if test="${status.index==0}">active</c:if>">
							<img src="${pageContext.request.contextPath}/${pic.iPic }" style="margin: auto; width: 100%;height:480px">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 上一张 下一张按钮 -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<!-- 热门商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>热门商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/Reception/img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="${pageContext.request.contextPath}/Reception/products/hao/big01.jpg" width="180" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
							<img src="${pageContext.request.contextPath}/Reception/products/hao/middle01.jpg" width="400px" height="200px" style="display: inline-block;">
					</div>
					<c:forEach items="${hotGoods}" var="index">
						<div class="col-md-2" style="font-size:12px;height:200px;padding:10px 0px;white-space: nowrap;text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;">
							<a>
								<img src="${pageContext.request.contextPath}/${index.iPic }" width="130" height="130">
							</a>
							<p><label>${index.iName }</label></p>
							<p><font color="#E4393C" style="font-size:16px;">&yen;${index.iSName }</font></p>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 广告条 -->
            <div class="container-fluid">
				<img src="${pageContext.request.contextPath}/Reception/products/hao/ad.jpg" width="100%"/>
			</div>
			
			<!-- 最新商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>最新商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/Reception/img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="${pageContext.request.contextPath}/Reception/products/hao/big01.jpg" width="180" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">	
							<img src="${pageContext.request.contextPath}/Reception/products/hao/middle01.jpg" width="400px" height="200px" style="display: inline-block;">
					</div>
				
					<c:forEach items="${newGoods }" var="index">
						<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
						<a>
							<img src="${pageContext.request.contextPath}/${index.iPic}" width="130" height="130" style="display: inline-block;">
						</a>
						<p><label>${index.iName }</label></p>
						<p><font color="#E4393C" style="font-size:16px; display: inline-block;" >&yen;${index.iSName }</font></p>
					</div>
					</c:forEach>
					
				</div>
			</div>			
			
			
			
		</div>
		<!-- 引入footer.jsp -->
			<jsp:include page="footer.jsp"></jsp:include>
	</body>

</html>