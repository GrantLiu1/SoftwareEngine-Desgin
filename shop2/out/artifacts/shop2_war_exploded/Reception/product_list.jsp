<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商品分类</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Reception/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Reception/css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<body>


	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp"></jsp:include>


	<div class="row" style="width: 1210px; margin: 0 auto;">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index?method=index">首页</a></li>
				<li><a href="#">查询结果</a></li>
			</ol>
		</div>
		<c:forEach items="${pageBean.list }" var="good">
			<div class="col-md-2" style="white-space: nowrap;text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;">
			<a href="${pageContext.request.contextPath}/goodsServlet?method=goodsInfo&gId=${good.gID}"> <img src="${pageContext.request.contextPath}/${good.gPic }"
				width="170" height="170" style="display: inline-block;">
			</a>
			<p>
				<a href="${pageContext.request.contextPath}/goodsServlet?method=goodsInfo&gId=${good.gID}" style='color: green'>${good.gName }</a>
			</p>
			<p>
				<font color="#FF0000">价格：&yen;${good.gPrice }</font>
			</p>
<%--			<p><font color="#FF0000">公益金：&yen;${good.gChar }</font></p>--%>
		</div>
		</c:forEach>

	</div>
	<c:if test="${pageBean.totalPage>1 }">
		<!--分页 -->
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">
		<!-- 上一页 -->
			<c:if test="${pageBean.currentPage==1 }">
				<li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span
						aria-hidden="true">&laquo;</span> </a></li>
			</c:if>
			<c:if test="${pageBean.currentPage > 1 }">
				<li><a href="${pageContext.request.contextPath}/goodsServlet?method=<c:if test="${!empty kindName }">findGoodListByKindName&kindName=${kindName }</c:if><c:if test="${!empty keyWord }">findGoodListByKeyWord&keyWord=${keyWord }</c:if>&currentPage=${pageBean.currentPage-1}" aria-label="Previous"><span
						aria-hidden="true">&laquo;</span> </a></li>
			</c:if>
			<!-- 页码 -->
			<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
						<li class="<c:if test="${page==pageBean.currentPage }">active</c:if>">
						<a href="${pageContext.request.contextPath}/goodsServlet?method=<c:if test="${!empty kindName }">findGoodListByKindName&kindName=${kindName }</c:if><c:if test="${!empty keyWord }">findGoodListByKeyWord&keyWord=${keyWord }</c:if>&currentPage=${page}">
						${page}</a></li>
					</c:forEach>
			
			<!-- 下一页 -->
			<c:if test="${pageBean.currentPage==pageBean.totalPage }">
				
				<li class="disabled"><a href="javascript:void(0)" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</c:if>
			<c:if test="${pageBean.currentPage < pageBean.totalPage }">
				<li><a href="${pageContext.request.contextPath}/goodsServlet?method=<c:if test="${!empty kindName }">findGoodListByKindName&kindName=${kindName }</c:if><c:if test="${!empty keyWord }">findGoodListByKeyWord&keyWord=${keyWord }</c:if>&currentPage=${pageBean.currentPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</div>
	<!-- 分页结束 -->
	</c:if>

	
		

	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>