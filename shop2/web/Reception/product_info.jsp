<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商品详情</title>
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Reception/css/style.css"
	type="text/css" />

<style>
.btn-new{
	width:90px; 
	height:38px; 
	color: white; 
	text-align:center;
	font-size:14px;
	background-color:#555;
	cursor:pointer;
	white-space:nowrap;
	display:inline-block;
	border:none;
	border-radius:2px;
	margin:8px;
}

body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

#add-to-cart {
	position: relative;
	border: 2px solid transparent;
	height: 40px;
	padding: 0 30px;
	background-color: #ef233c;
	color: #FFF;
	text-transform: uppercase;
	font-weight: 700;
	border-radius: 40px;
	-webkit-transition: 0.2s all;
	transition: 0.2s all;
	height: 36px;
	width: 127px;
}

#add-to-cart:hover {
	background-color: #FFF;
	color: #D10024;
	border-color: #D10024;
	/* padding: 0px 30px 0px 50px; */
}

#add-to-cart:hover>i {
	opacity: 1;
	visibility: visible;
}
</style>
<script>
$(function() {
 	$("#dialog_tousu").dialog({
      height: 200,
      width: 550,
      resizable: false,
      modal: true,
      autoOpen: false,
      show: {
        effect: "clip",
        duration: 200
      },
    });
    
    $(".btn-upd").click(function() {
    	var xmlhttp; 
	  	var key = ${goods.gID };
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
	       		document.getElementById("change_tousu").innerHTML=xmlhttp.responseText;
	    	}
	  	}
	    xmlhttp.open("GET","${pageContext.request.contextPath}/Reception/ajax/touSu.jsp?key="+key,true);
	  	xmlhttp.send();
		$("#dialog_tousu").dialog( "open" );	
	});
 });
</script>

</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div
				style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
				<a href="${pageContext.request.contextPath}/index/method=index">首页&nbsp;&nbsp;&gt;</a>
				<a href="#">商品详情</a>
			</div>

			<div style="margin: 0 auto; width: 950px;">
				<div class="col-md-6">
					<img style="opacity: 1; width: 350px; height: 350px;" title=""
						class="medium" src="${pageContext.request.contextPath}/${goods.gPic }">
				</div>

				<div class="col-md-6">
					<div>
						<strong>${goods.gName }</strong>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
						<div>编号：${goods.gID }</div>
					</div>

					<div style="margin: 10px 0 10px 0;">
						价格: <strong style="color: #ef0101;">￥&nbsp;${goods.gPrice}</strong>
					</div>

					<form
						action="${pageContext.request.contextPath}/cart?method=addGoodsToCart&gId=${goods.gID}&sellerId=${seller.userID}&userId=${user.userID}"
						method="post">
						<input type="hidden" name="gPrice" value="${goods.gPrice}" />
						<div
							style="padding: 10px; border: 1px solid #ff3030; width: 330px; margin: 15px 0 10px 0;; background-color: #fffee6;">
							<div
								style="border-bottom: 1px solid #faeac7; margin-top: 20px; padding-left: 10px;">
								购买数量: <input id="buyNum" name="buyNum" value="1" maxlength="4"
									size="10" type="text">
							</div>

							<div style="margin: 20px 0 10px 0;; text-align: center;">
								<a href="javascript:void(0)" style="text-decoration:none">
								<input value="加入购物车" type="submit" id="add-to-cart">
								</a>
								&nbsp;
								<div id="showStoreFlag" style="float: right">
									<a id="store-url" href="javascript:void(0)"
										title="<c:if test='${empty store}'>收藏该商品</c:if><c:if test='${!empty store}'>取消收藏该商品</c:if>" onclick="<c:if test='${empty user }'>toLogin()</c:if><c:if test='${!empty user && empty store }'>storeGoods()</c:if><c:if test='${!empty user && !empty store}'>cancelStore()</c:if>">
										<span id="store-goods" style="float:right;background:url('${pageContext.request.contextPath}/Reception/img/<c:if test='${empty store }'>store1.png</c:if><c:if test='${!empty store }'>store2.png</c:if>') no-repeat; height: 32px;width:36px">
										</span>
									</a>
							</div>

							</div>
							<span>${msg}</span>
						</div>
						<script type="text/javascript">
							
						</script>
					</form>
					<div style="width: 330px; height: 50px">
						<span>卖家：</span><a
							href="${pageContext.request.contextPath}/user?method=findSellerById&id=${seller.userID}"><span>${seller.userName }</span></a>
						<c:if test="${!empty user}">
							<span class="btn-upd" style="float:right;">投诉</span>
						</c:if>				
					</div>
				</div>
			</div>

			<div class="clear"></div>
			<div style="width: 950px; margin: 0 auto;">
				<div
					style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
					<strong onclick="showDes()" style="cursor:pointer">商品介绍</strong>
					<strong onclick="showEva()" style="cursor:pointer;margin-left:10px">商品评价</strong>
				</div>

				<div id="showDes">
					<img
						src="${pageContext.request.contextPath}/${goods.gDes}" style="width: 930px;">
				</div>
				<div id="showEvaluation" style="width: 100%"></div>
				<div id="btn"
					style="border-top: 1px solid #ccc; display: none; text-align: right">
					<a href="javascript:void(0)"><input type="button" value="上一页"
						id="up" onclick="toLastPage()" /></a> <a href="javascript:void(0)"><input
						type="button" value="下一页" id="down" onclick="toNextPage()" /></a>
				</div>
			</div>
			<script type="text/javascript">
			//未登录状态无法收藏，提醒用户登录
				function toLogin(){
					alert("请完成登录再进行操作");
				}
			
			//已登录状态，且已收藏该商品，点击取消收藏
				function cancelStore(){
					var content = "";
					$.post(
							"${pageContext.request.contextPath}/store",
							{
								"method":"deleteStore",
								"gId":"${goods.gID}",
								"userId":"${user.userID}"
							},
							function(data){
									alert("已取消收藏");
									content += "<a href='javascript:void(0)' title='收藏该商品' onclick='storeGoods()'><span id='store-goods'"
									+"style=\"float:right;background:url('${pageContext.request.contextPath}/Reception/img/store1.png') no-repeat; height: 32px;width:36px\">"
									+"</span></a>";
									$("#store-url").css("display","none");
									$("#showStoreFlag").html(content);
							},
							"json"
							);
					
				}
			//已登录状态，且未收藏该商品，点击收藏
				function storeGoods(){
					var content = "";
					$.post(
							"${pageContext.request.contextPath}/store",
							{
								"method":"addStore",
								"gId":"${goods.gID}",
								"userId":"${user.userID}"
							},
							function(data){
									alert("已收藏该商品");
									content += "<a href='javascript:void(0)' title='取消收藏' onclick='cancelStore()'><span id='store-goods'"
										+"style=\"float:right;background:url('${pageContext.request.contextPath}/Reception/img/store2.png') no-repeat; height: 32px;width:36px\">"
										+"</span></a>";
									$("#store-url").css("display","none");
									$("#showStoreFlag").html(content);
							},
							"json"
							);
				}
			function showDes() {
				$("#showDes").css("display","block");
				$("#showEvaluation").css("display","none");
			}
			</script>
			<script type="text/javascript">		
			function showEva() {
				var content = "";
				$.post(
				"${pageContext.request.contextPath}/evaluation",
				{
					"method" : "findEvaluationsByGId",
					"gId" : "${goods.gID}",
					"currentPage" : "1",
					"rows" : "5"
				},
				function(data) {
					var eva = data.list;
					for (var i = 0; i < eva.length; i++) {
						content += "<div style='height:80px;padding-top:18px;border-top:1px solid #ccc;'>"
								+ "<span>"
								+ eva[i].user.nickName
								+ ":</span><span style='float:right;font-size:10px'>"+eva[i].eTime+"</span>"
								+ "<p style='text-indent:2em'>"
								+ eva[i].eContent
								+ "</p></div>";
					}
					content += "<div style='text-align:right'><span id='currentPage'>"+data.currentPage+"</span><span>/"+data.totalPage+"<span></div>";
					$("#showEvaluation").html(content);
					$("#btn").css("display","block");
					if(data.totalPage <= 1){
						$("#up").css("display","none");
						$("#down").css("display","none");
					}else{
						if(data.currentPage <= 1){
							$("#up").css("pointer-events","none");
							if(data.currentPage < data.totalPage){
								$("#down").css("pointer-events","auto");
							}else{
								$("#down").css("pointer-events","none");
							}
						}else{
							$("#up").css("pointer-events","auto");
							if(data.currentPage < data.totalPage){
								$("#down").css("pointer-events","auto");
							}else{
								$("#down").css("pointer-events","none");
							}
						}
					}
				}, 
				"json");
				$("#showDes").css("display","none");
				$("#showEvaluation").css("display","block");
			}

			function toLastPage() {
				var content = "";
				var cuPage = $("#currentPage").text();
				$.post(
				"${pageContext.request.contextPath}/evaluation",
				{
					"method" : "findEvaluationsByGId",
					"gId" : "${goods.gID}",
					"currentPage" : parseInt(cuPage)-1,
					"rows" : "5"
				},
				function(data) {
					var eva = data.list;
					for (var i = 0; i < eva.length; i++) {
						content += "<div style='height:80px;padding-top:18px;border-top:1px solid #ccc;'>"
								+ "<span>"
								+ eva[i].user.nickName
								+ ":</span><span style='float:right;font-size:10px'>"+eva[i].eTime+"</span><br>"
								+ "<p style='text-indent:2em'>"
								+ eva[i].eContent
								+ "</p></div>";
					}
					content += "<div style='text-align:right'><span id='currentPage'>"+data.currentPage+"</span><span>/"+data.totalPage+"<span></div>";
					$("#showEvaluation").html(content);
					$("#btn").css("display","block");
					
						if(data.currentPage <= 1){
							$("#up").css("pointer-events","none");
							if (data.data.currentPage < data.totalPage){
								$("#down").css("pointer-events","auto");
							}else{
								$("#down").css("pointer-events","none");
							}
						}else {
							$("#up").css("pointer-events","auto");
							if (data.data.currentPage < data.totalPage){
								$("#down").css("pointer-events","auto");
							}else{
								$("#down").css("pointer-events","none");
							}
						}
				}, 
				"json");			
			}

			function toNextPage() {
				var content = "";
				var cuPage = $("#currentPage").text();
				
				$.post(
				"${pageContext.request.contextPath}/evaluation",
				{
					"method" : "findEvaluationsByGId",
					"gId" : "${goods.gID}",
					"currentPage" : parseInt(cuPage)+1,
					"rows" : "5"
				},
				function(data) {
					var eva = data.list;
					for (var i = 0; i < eva.length; i++) {
						content += "<div style='height:80px;padding-top:18px;border-top:1px solid #ccc;'>"
								+ "<span>"
								+ eva[i].user.nickName
								+ ":</span><span style='float:right;font-size:10px'>"+eva[i].eTime+"</span><br>"
								+ "<p style='text-indent:2em'>"
								+ eva[i].eContent
								+ "</p></div>";
					}
					content += "<div style='text-align:right'><span id='currentPage'>"+data.currentPage+"</span><span>/"+data.totalPage+"<span></div>";
					$("#showEvaluation").html(content);
					$("#btn").css("display","block");
					
					if(data.currentPage >= data.totalPage){
						//$("#down").attr("disabled","disabled");
						$("#down").css("pointer-events","none");
						$("#up").css("pointer-events","auto");
					}else{
						$("#down").css("pointer-events","auto");
						$("#up").css("pointer-events","auto");
					}
				}, 
				"json");
			}
			</script>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

	<div id="dialog_tousu" title="商品投诉">
		<form action="${pageContext.request.contextPath}/complaintsServlet?method=addComp" method="post">
			<table border="0">
			  <tr>
			    <td width="100" height="30" align="right" valign="top">投诉理由：</td>
			    <td width="300" id="change_tousu" height="30" valign="middle"></td>
			    <td width="100" height="30" valign="middle">&nbsp;</td>
			  </tr>
			  <tr>
			    <td width="100" height="50" valign="middle">&nbsp;</td>
			    <td width="300" height="50" valign="middle">&nbsp;</td>
			    <td width="100" height="50" valign="middle">
			    	<input type="submit" class="btn-new" value="提交">
			    </td>
			  </tr>
			</table>
		</form>
	</div>

</body>

</html>