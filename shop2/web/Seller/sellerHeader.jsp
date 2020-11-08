<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/css/style.css">
<!-- Fonts-->
<link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/ps-icon/style.css">
<!-- CSS Library-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/owl-carousel/assets/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/slick/slick/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/Magnific-Popup/dist/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/revolution/css/settings.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/revolution/css/layers.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Seller/plugins/revolution/css/navigation.css">
<style type="text/css"> 
	.line{
    margin:0 auto;
    border-bottom:1px solid #ccc;
    width:100%;
}
</style> 
</head>
<body>
  <div class="header__top">
	<div class="container-fluid">
	  <div class="row">
			<div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 ">
			  <p>Team of Soft2017123</p>
			</div>
			<div class="col-lg-6 col-md-4 col-sm-6 col-xs-12 ">
			  <div class="header__actions"><a href="../Reception/login.jsp">Login & Regiser</a>
				<div class="btn-group ps-dropdown"><a class="dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">2020/06/25<i class="fa fa-angle-down"></i></a>
				</div>
				<div class="btn-group ps-dropdown"><a class="dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Version 1.5<i class="fa fa-angle-down"></i></a>
				</div>
			  </div>
			</div>
	  </div>
	</div>
  </div>
  <div class="line"></div>
  <nav class="navigation">
	<div class="container-fluid">
		<!-- 上左 -->
		<div class="navigation__column left">
			<div class="header__logo"><a class="ps-logo" href="sellerHome.jsp"><img src="${pageContext.request.contextPath}/Seller/images/logo2.png" style="width: 400px; height: 100px;"></a></div>
	  	</div>
	  	<!-- 上中 -->
		<div class="navigation__column center">
				<ul class="main-menu menu">
				  <li class="menu-item"><a href="${pageContext.request.contextPath}/Seller/sellerHome.jsp">主页</a></li>
				  <li class="menu-item menu-item-has-children dropdown"><a href="${pageContext.request.contextPath}/Seller/goods/goods_list.jsp">商品管理</a>
						<ul class="sub-menu">
						  <li class="menu-item"><a href="${pageContext.request.contextPath}/Seller/goods/goods_list.jsp">商品列表</a></li>
						  <li class="menu-item"><a href="${pageContext.request.contextPath}/Seller/goods/add_goods.jsp">发布商品</a></li>
						</ul>
				  </li>
				  <li class="menu-item menu-item-has-children dropdown"><a href="${pageContext.request.contextPath}/Seller/order/deliverOrder.jsp">订单管理</a>
						<ul class="sub-menu">
						  <li class="menu-item"><a href="${pageContext.request.contextPath}/Seller/order/deliverOrder.jsp">未发货订单</a></li>
						  <li class="menu-item"><a href="${pageContext.request.contextPath}/Seller/order/order_list.jsp">已发货订单</a></li>
						</ul>
				  </li>
				  <li class="menu-item"><a href="${pageContext.request.contextPath}/Seller/personal/sellerInform.jsp">个人中心</a></li>
				  <li class="menu-item"><a href="${pageContext.request.contextPath}/Seller/contactUs.jsp">联系我们</a></li>
				  <li class="menu-item"><a href="${pageContext.request.contextPath}/user?method=exit">退出</a></li>
				</ul>
	  </div>
  	</div>
  </nav>
<!--   中部灰色分割线 为了好看 -->
  <div class="header-services">
	  <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
		<p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: To give you a better sales experience</p>
	  </div>
  </div>
  <div class="line"></div>
</body>
</html>