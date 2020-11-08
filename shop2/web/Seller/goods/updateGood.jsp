<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
    <%@ page import="com.shop.dao.*,com.shop.entity.*"%>
    <%@ page import="com.shop.mapper.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/Reception/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<!-- <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
引入表单校验jquery插件
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script> -->
<style>
input,select{
	width:270px;
	height:30px;
	font-size:17px;
	margin-bottom:20px;
}

.divForm{
width: 570px;
height: 470px;
border:1px solid #fff;
text-align: center;/*(让div中的内容居中)*/
margin-left:30%;
background-color: white
}

</style>
<%
	
%>
<body>
	<jsp:include page="../sellerHeader.jsp"></jsp:include>
	<div style="text-align:center;height: 100%;background: url('${pageContext.request.contextPath}/Seller/images/regist_bg.jpg'); margin-top:5px;" >
<div class="divForm">
<form id="myform" method="post" enctype="multipart/form-data" >
<div style="width:300px;float:left;margin:auto;margin-top:10px">

	<%
		int gId = Integer.parseInt(request.getParameter("gId"));
        GoodsDao goodsDaoImpl=new GoodsDao();
    	List<Goods> list=goodsDaoImpl.selectOneGoods(gId);
    	Goods good = new Goods();
    	for(Goods goods:list){
    		good.setgName(goods.getgName());
    		good.setgKind(goods.getgKind());
    		good.setgPrice(goods.getgPrice());
    		good.setgAmount(goods.getgAmount());
    		good.setgChar(goods.getgChar());
    	}
    	System.out.println("商品名:"+good.getgName()+",商品种类:"+good.getgKind()+",商品价格:"+good.getgPrice()+",商品数量:"+good.getgAmount());
    %>
	<div class="">
		<label>商品名称</label>
			<div>
				<input  id="gName" name="gName" style="color:blue" value="<%=good.getgName()%>" type="text" >
			</div>
	</div>
	
	<div class="">
		<label>商品类别</label>
			<div>
			<select name="gKind" class="" id="gKind">
			  <option  value="数码家电">数码家电</option>
			  <option  value="生鲜蔬果">生鲜蔬果</option>
			  <option  value="潮牌衣柜">潮牌衣柜</option>
			  <option  value="零食酒水">零食酒水</option>
			  <option  value="图书娱乐">图书娱乐</option>
			  <option  value="装修家具">装修家具</option>
			  <option  value="日用百货">日用百货</option>
			</select>
			</div>
			<script>
			
			
			var obj = document.getElementById('gKind'); 
			console.log(obj.options.length);
            for(var i = 0; i < obj.options.length; i++){
	                var tmp = obj.options[i].value;
	                if(tmp === <%=good.getgKind()%>){
	                    obj.options[i].selected = 'selected';
	                    break;
	                }
	            }
			</script>
			
	</div>
	
	
	<div class="">
			<label>商品价格 </label>
				<div class="">
					<input id="gPrice" name="gPrice" style="color:blue" value="<%=good.getgPrice()%>" type="text" value="" >
				</div>
	</div>
	
	<div class="">
			<label>商品数量 </label>
				<div class="">
					<input  id="gAmount" name="gAmount" style="color:blue" value="<%=good.getgAmount()%>" type="text" >
			</div>
	</div>
								
	<div class="">
			<label>公益金 </label>
				<div class="" style="display: none">
					<input class="" id="gChar" name="gChar" style="color:blue" value="<%=good.getgChar()%>" type="text" >
				</div>
	</div>
</div>
<div style="float:left;margin-top:20px;margin-left:35px">
	<!-- 商品图片 -->
	<div >
		<label class="" > 商品图片</label>
		<div class="">
            <div>
				<div class="" style="width: 200px; height: 150px;">
					<input id="file1" name="file1" type="file" style="width: 200px; height: 150px;background-image:url(images/noimg.gif)" multiple="multiple">
				</div>
			</div>
		</div>
	</div>

	<!-- 商品描述 -->
	<div style="margin-top:18px">
		<!-- Text input-->
		<label> 商品描述</label>
		<div class="">
			<div class=" " >
				<div class=" " style="width: 200px; height: 150px;">
					<input id="file2" name="file2" type="file" style="width: 200px; height: 150px;background-image:url(images/noimg.gif)" multiple="multiple">
				</div>
			</div>
		</div>
	</div>
</div>
	<input type="text" style="display:none" id="s1" name="s1"/>
	<input type="text" style="display:none" id="s2" name="s2"/>
	<input type="text" style="display:none" id="gId" name="gId" value="<%=gId %>"/>

	<div align="center" style="clear: both; margin-top:60px">
		<input type="submit" style="width:150px;height:35px;" value="提交" id="go" name="go" class="">
		<input type="button" style="width:150px;height:35px;" value="取消" onclick="javascript:window.location.href = 'goods_list.jsp'">
	</div>
</form>
</div>
</div>
</body>
<script type="text/javascript">
document.getElementById("go").onclick = function(){
	var file1 = document.getElementById('file1');
	var file2 = document.getElementById('file2');
	var imgStr = /\.(jpg|jpeg|png|bmp|BMP|JPG|PNG|JPEG)$/;
	var imgFile1 = file1.files[0];
	var imgFile2 = file2.files[0];
	
	if(file1.value && file2.value){
		if(!imgStr.test(imgFile1.name)) {
			alert("上传的商品图片不是图片格式!");
			return false;
		}else if (!imgStr.test(imgFile2.name)){
			alert("上传的商品描述不是图片格式!");
			return false;
		}else{
			$("#s1").val("1");
	 		$("#s2").val("2");
	 		document.getElementById("myform").action="${pageContext.request.contextPath}/goodsServlet?method=updateGoods" 
	   		document.getElementById("myform").submit();
	 		alert('修改成功!');
		}
	}
	if(!file1.value && file2.value){
		if (!imgStr.test(imgFile2.name)){
			alert("上传的商品描述不是图片格式!");
			return false;
		}else{
			$("#s1").val("0");
	 		$("#s2").val("2");
	 		document.getElementById("myform").action="${pageContext.request.contextPath}/goodsServlet?method=updateGoods" 
	   		document.getElementById("myform").submit();
	 		alert('修改成功!');
		}
	}
	if(file1.value && !file2.value){
		if (!imgStr.test(imgFile1.name)){
			alert("上传的商品图片不是图片格式!");
			return false;
		}else{
			$("#s1").val("1");
	 		$("#s2").val("0");
	 		document.getElementById("myform").action="${pageContext.request.contextPath}/goodsServlet?method=updateGoods" 
	   		document.getElementById("myform").submit();
	 		alert('修改成功!');
		}
	}
	if(! file1.value && !file2.value){
 		$("#s1").val("0");
 		$("#s2").val("0");
 		document.getElementById("myform").action="${pageContext.request.contextPath}/goodsServlet?method=updateGoods" 
   		document.getElementById("myform").submit();
 		alert('修改成功!');
	} 
}
</script>
</html>