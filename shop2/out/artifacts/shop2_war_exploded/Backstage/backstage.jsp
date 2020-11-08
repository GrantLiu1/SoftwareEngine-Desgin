<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/newType.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1"/>

<script> 
$(document).ready(function(){
  $(".li-xs").click(function(){
    $(".li1").slideToggle("slow");
  });
  
  $(".li-jh").click(function(){
    $(".li2").slideToggle("slow");
  });
  
  $(".li-rs").click(function(){
    $(".li3").slideToggle("slow");
  });
  
  $(".li-cw").click(function(){
    $(".li4").slideToggle("slow");
  });
  
  $(".li-eva").click(function(){
	$(".li5").slideToggle("slow");
	});
  
  $(".li-adv").click(function(){
		$(".li6").slideToggle("slow");
	});
  
  $(".li1").click(function(){
  	$(".li1").css("background-color","#393D49");
  	$(".li2").css("background-color","#393D49");
  	$(".li3").css("background-color","#393D49");
  	$(".li4").css("background-color","#393D49");
  	$(".li5").css("background-color","#393D49");
  	$(".li6").css("background-color","#393D49");
	$(this).css("background-color","#009688");
  });
	
  $(".li2").click(function(){
  	$(".li1").css("background-color","#393D49");
  	$(".li2").css("background-color","#393D49");
  	$(".li3").css("background-color","#393D49");
  	$(".li4").css("background-color","#393D49");
  	$(".li5").css("background-color","#393D49");
  	$(".li6").css("background-color","#393D49");
	$(this).css("background-color","#009688");
  });
  
  $(".li3").click(function(){
  	$(".li1").css("background-color","#393D49");
  	$(".li2").css("background-color","#393D49");
  	$(".li3").css("background-color","#393D49");
  	$(".li4").css("background-color","#393D49");
  	$(".li5").css("background-color","#393D49");
  	$(".li6").css("background-color","#393D49");
	$(this).css("background-color","#009688");
  });
  
  $(".li4").click(function(){
  	$(".li1").css("background-color","#393D49");
  	$(".li2").css("background-color","#393D49");
  	$(".li3").css("background-color","#393D49");
  	$(".li4").css("background-color","#393D49");
  	$(".li5").css("background-color","#393D49");
  	$(".li6").css("background-color","#393D49");
	$(this).css("background-color","#009688");
  });
  
  $(".li5").click(function(){
	  	$(".li1").css("background-color","#393D49");
	  	$(".li2").css("background-color","#393D49");
	  	$(".li3").css("background-color","#393D49");
	  	$(".li4").css("background-color","#393D49");
	  	$(".li5").css("background-color","#393D49");
	  	$(".li6").css("background-color","#393D49");
		$(this).css("background-color","#009688");
	  });
  $(".li6").click(function(){
	  	$(".li1").css("background-color","#393D49");
	  	$(".li2").css("background-color","#393D49");
	  	$(".li3").css("background-color","#393D49");
	  	$(".li4").css("background-color","#393D49");
	  	$(".li5").css("background-color","#393D49");
	  	$(".li6").css("background-color","#393D49");
		$(this).css("background-color","#009688");
	  });
});
</script>

<style type="text/css">

ul{
	margin:0px;
	padding:0px;
	list-style-type:none;
	border:0px;
}

a{
	text-decoration:none;
}

.li1,.li2,.li3,.li4,.li5,.li6{
	float:left;
	width:150px;
	height:45px;
	line-height:45px;
	display:none;
	color:#FFF;
	font-size:14px;
	cursor:pointer;
}
</style>

<meta charset="UTF-8">
<title>校园线上交易平台后台管理</title>
</head>
<body>
<div id="whole" align="center" style="overflow:hidden">
	<div id="top">
	<div align="left" style="margin-left: 20px;font-size: 25px;">x交易平台后台管理
	<button class="btn" style="float:right;margin-top:30px">退出登录</button>
	</div>
	</div>
	<div id="left">
		<ul>
            <li class="li-xs">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户管理<span class="dot-bottom"></span></li>
               	<a href="user/user_list.jsp" target="works"><li class="li1">用户列表</li></a>
               	<a href="user/user_check.jsp" target="works"><li class="li1">卖家身份审核</li></a>
			<a href="user/kuser_check.jsp" target="works"><li class="li1">快递员身份审核</li></a>
            <li class="li-jh">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品管理<span class="dot-bottom"></span></li> 
               	<a href="xs/goods.jsp" target="works"><li class="li2">商品列表</li></a>
               	<a href="xs/goods_check.jsp" target="works"><li class="li2">商品审核</li></a>
            <li class="li-rs">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单管理<span class="dot-bottom"></span></li>
               	<a href="order/order_list.jsp" target="works"><li class="li3">订单列表</li></a>
            <li class="li-cw">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投诉管理<span class="dot-bottom"></span></li>
               	<a href="complaint/complaints_list.jsp" target="works"><li class="li4">投诉列表</li></a>
            <li class="li-eva">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评价管理<span class="dot-bottom"></span></li>
               	<a href="evaluation/evaluation_list.jsp" target="works"><li class="li5">评价列表</li></a>
           	<li class="li-adv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广告管理<span class="dot-bottom"></span></li>
           		<a href="adv/adv_list.jsp" target="works"><li class="li6">广告列表</li></a>
           		<a href="adv/add_adv.jsp" target="works"><li class="li6">上传广告</li></a>
            </ul>
	</div>
	<div id="right">
		<iframe src="homepage.html" name="works" frameborder="0" width="100%" height="100%"></iframe>
	</div>
	<div id="bottom">
	<div align="right" style="margin-right:10px;color:#e0e0e0;font-size:5px;font-weight:200;
	font-family:"Microsoft YaHei", Verdana, Geneva, sans-serif;">HHIT-SECD-RJ171</div>
	</div>
	
	<div id="dialogExit" title="是否确认退出?">
		<form action="${pageContext.request.contextPath}/user?method=exit_admin" method="post" style="text-align:center">
			<div id="exit" align="center"></div>
			<input type="submit" value="确定">
			<input type="button" style="margin-right:10px" value="取消" onclick="close()">
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
$(function() {
	$("#dialogExit").dialog({
      height: 100,
      width: 180,
      resizable: false,
      modal: true,
      autoOpen: false,
      show: {
        effect: "clip",
        duration: 200
      },
    });

	 $(document).on('click', '.btn', function () {
	    	var xmlhttp; 
		  	//var key=$(this).parent().parent().children().first().text().trim(); 
		  	if (window.XMLHttpRequest){
		    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		    	xmlhttp=new XMLHttpRequest();
		  	}
		  	else{
		    	 //IE6, IE5 浏览器执行代码
		    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  	}
		  	xmlhttp.onreadystatechange=function(){
	    	if (xmlhttp.readyState==4 && xmlhttp.status==200){
	       		document.getElementById("exit").innerHTML=xmlhttp.responseText;
	    	}
	  	}
		    xmlhttp.open("POST","./ajax/exit.jsp",false);
		  	xmlhttp.send();  
		  	
			$("#dialogExit").dialog( "open" );
		});
	 }); 
</script>
</html>