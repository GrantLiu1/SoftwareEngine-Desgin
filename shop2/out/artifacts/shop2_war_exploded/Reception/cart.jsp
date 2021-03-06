<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商城购物车</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js" type="text/javascript"></script>
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
		</style>
	</head>

	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="header.jsp"></jsp:include>

		<c:if test="${empty cartList }">
			<div style="width:100%;height:300px">
				<div style="width:300px;height:50px;margin-top:180px;margin-left:500px">
					<img alt="" src="${pageContext.request.contextPath}/Reception/img/nocart.png">
					<span>购物车空空如也，赶紧去<a href="${pageContext.request.contextPath}/index?method=index">购物</a>吧</span>
				</div>
			</div>
		</c:if>
		<c:if test="${!empty cartList }">
		<div class="container">
			<div class="row">

				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong style="font-size:16px;margin:5px 0;">购物车</strong>
					<table class="table table-bordered">
						<tbody>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${cartList }" var="cart">
							<tr class="active">
								<td width="60" width="40%"><input type="hidden" name="id"
									value="22"> <img src="${cart.gPic }" width="70"
									height="60"></td>
								<td width="30%"><a target="_blank"> ${cart.gName }</a></td>
								<td width="20%">￥${cart.gPrice }</td>
								<td width="10%">${cart.buyNum }</td>
								<td width="15%"><span class="subtotal">￥${cart.totalPrice }</span></td>
								<td><a href="${pageContext.request.contextPath}/cart?method=deleteCartItemById&cartItemId=${cart.cartItemId}" class="delete">删除</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div style="margin-right:130px;">
				<div style="text-align:right;">
					商品金额: <strong style="color:#ff6600;">￥${price }</strong>
				</div>
				<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
					<a href="${pageContext.request.contextPath}/cart?method=deleteAllCartItem" id="clear" class="clear">清空购物车</a>
					<a href="${pageContext.request.contextPath}/orders?method=showOrders">
						<input type="submit" width="100" value="提交订单" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/Reception/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						height:35px;width:100px;color:white;">
					</a>
				</div>
			</div>

		</div>
</c:if>
		<!-- 引入footer.jsp -->
		<jsp:include page="footer.jsp"></jsp:include>

	</body>

</html>