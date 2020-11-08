<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shop.dao.AddressDao,com.shop.entity.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>订单信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/jquery.validate.min.js" type="text/javascript"></script>
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
.error{
	color:red;
}
</style>
<script type="text/javascript">
		$(function() {
			$("#userInfo").validate({
				rules : {
					"user" : {
						"required" : true,
					},
					"phone" : {
						"required" : true
					},
					"aContent":{
						"required" : true
					}
				},
				messages : {
					"user" : {
						"required" : "收货人不能为空",
					},
					"phone" : {
						"required" : "联系方式不能为空",
					},
					"aContent":{
						"required" : "收货地址不能为空",
					}
				}
			});
		});
		</script>
</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
	
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<strong>订单详情</strong>
				<table class="table table-bordered">
					<tbody>
					<c:forEach items="${orderList }" var="order">
						<tr class="warning">
							<th colspan="5">订单编号:${order.cartItemId }</th>
						</tr>
						<tr class="warning">
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<tr class="active">
							<td width="15%"><input type="hidden" name="id"
								value="22"> <img src="${order.gPic }" width="70"
								height="60"></td>
							<td width="45%"><a target="_blank">${order.gName }</a></td>
							<td width="15%">￥${order.gPrice }</td>
							<td width="10%">${order.buyNum }</td>
							<td width="15%"><span class="subtotal">￥${order.totalPrice }</span></td>
						</tr>
					</c:forEach>
						
					</tbody>
				</table>
				<div style="text-align:right;">

					商品金额: <strong style="color:#ff6600;">￥${price }</strong>
				</div>
			</div>
		</div>

		<div>
			<hr />
			<form class="form-horizontal" method="post" id="userInfo"
				style="margin-top: 5px; margin-left: 150px;" action="${pageContext.request.contextPath }/orders?method=addOrders">
				<div class="form-group">
					<%--@declare id="username"--%><label for="username" class="col-sm-1 control-label">地址</label>
					<div class="col-sm-5">
						<select name="aContent" id="aContent" class="form-control" >
						  <% AddressDao dao=new AddressDao();
					      	 User user = (User) session.getAttribute("user");
					         List<Address> list=dao.selectUserAddress(user.getUserID());   
					         for(Address address:list) 
					     {%>
						  <option value=<%=address.getaContent() %>><%=address.getaContent() %></option>
						  <%}%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<%--@declare id="inputpassword3"--%><label for="inputPassword3" class="col-sm-1 control-label">收货人</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user" name="user"
							placeholder="请输收货人">
					</div>
				</div>
				<div class="form-group">
					<%--@declare id="confirmpwd"--%><label for="confirmpwd" class="col-sm-1 control-label">电话</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="请输入联系方式">
					</div>
				</div>

			<hr />

			<div style="margin-top: 5px; margin-left: 150px;">
				
				<hr/>
				<p style="text-align: right; margin-right: 100px;">
						<input type="submit" style="width:204px; height:51px;">
						<%-- <img src="${pageContext.request.contextPath}/Reception/images/finalbutton.gif" width="204" height="51" border="0" /> --%>
				</p>
				<hr/>

			</div>
			</form>
		</div>
		
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>