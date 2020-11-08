<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<!-- 引入表单校验jquery插件
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


</style>
<body>
	<jsp:include page="../sellerHeader.jsp"></jsp:include>
	<div style="text-align:center;height: 100%;background: url('${pageContext.request.contextPath}/Seller/images/regist_bg.jpg');" >
	<div class="divForm" >
	<form id="myform" action="${pageContext.request.contextPath}/goodsServlet?method=addGoods" method="post" enctype="multipart/form-data" >
	<div style="width:300px;float:left;margin:auto;margin-top:10px">
		<div class="">
			<label>商品名称</label>
				<div>
					<input  id="gName" name="gName" placeholder="商品名称" type="text" value="">
				</div>
		</div>
		
		<div class="">
			<label>商品类别</label>
				<div>
				<select name="gKind" class="" id="gKind">
				  <option value="shuma">数码家电</option>
				  <option value="shuiguo">生鲜蔬果</option>
				  <option value="yifu">潮牌衣柜</option>
				  <option value="jiushui">零食酒水</option>
				  <option value="book">图书娱乐</option>
				  <option value="house">装修家具</option>
				  <option value="baihuo">日用百货</option>
				</select>
				</div>
				
		</div>
		
		
		<div class="">
				<label>商品价格 </label>
					<div class="">
						<input id="gPrice" name="gPrice" placeholder="商品价格" type="text" value="" >
					</div>
		</div>
		
		<div class="">
				<label>商品数量 </label>
					<div class="">
						<input  id="gAmount" name="gAmount" placeholder="商品数量" type="text" >
				</div>
		</div>
									
		<div class="" style="display: none">
				<label>公益金 </label>
					<div class="">
						<input class="" id="gChar" name="gChar" placeholder="公益金" type="text" value="0.0">
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
						<input id="file1" name="file1" type="file" style="width: 200px; height: 150px;" multiple="multiple">
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
						<input id="file2" name="file2" type="file" style="width: 200px; height: 150px;" multiple="multiple">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
		<div align="center" style="clear: both; margin-top:60px">
			<input type="submit" style="width:150px;height:35px;" value="提交" id="go" name="go" class="">
		</div>
	</form>
	</div>
	</div>
</body>
<script>
	document.getElementById("go").onclick = function(){
		var img1 = document.getElementById("file1");
		var img2 = document.getElementById("file2");
		var imgFile1 = img1.files[0];
		var imgFile2 = img2.files[0];
		/*图片类型正则验证*/
		var imgStr = /\.(jpg|jpeg|png|bmp|BMP|JPG|PNG|JPEG)$/;
		if (document.getElementById("gName").value=="" ||document.getElementById("gAmount").value==""
	   	    ||document.getElementById("gPrice").value==""||document.getElementById("gChar").value==""){
	   	    alert('填写格式错误!');
	   	    return false;
	  	}else if(img1.value == "" || img2.value == ""){
			alert("请上传图片!");
			return false;
		}else if(!imgStr.test(imgFile1.name)) {
			alert("上传的商品图片不是图片格式!");
			return false;
		}else if (!imgStr.test(imgFile2.name)){
			alert("上传的商品描述不是图片格式!");
			return false;
		}else{
				alert('提交成功!');
				$("#myform").submit();
			}
	}
</script>
</html>