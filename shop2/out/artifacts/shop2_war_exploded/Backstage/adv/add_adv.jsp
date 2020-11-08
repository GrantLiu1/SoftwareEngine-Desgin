<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/main-middle.css">
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
position: absolute;/*绝对定位*/
width: 570px;
height: 400px;
text-align: center;/*(让div中的内容居中)*/
top: 50%;
left: 50%;
margin-top: -230px;
margin-left: -280px;
}

</style>
<body>
 <div id="top">
    	<div id="top-letf">上传广告</div>
    </div>
    <div id="middle">
<div class="divForm">
<form id="myform" action="${pageContext.request.contextPath}/index?method=uploadPage_admin" method="post" enctype="multipart/form-data">
<div style="width:300px;float:left;margin-top:20px">
	<div class="">
		<label>广告标题</label>
			<div>
				<input  id="iName" name="iName" placeholder="广告标题" type="text" value="">
			</div>
	</div>
	
	<div class="">
		<label>广告副标题</label>
			<div>
				<input  id="iSName" name="iSName" placeholder="广告副标题" type="text" value="">
			</div>
	</div>
	
	<div>
		<label>广告类别</label>
			<div>
			<select name="iKind" class="" id="iKind">
			  <option value="轮播图">轮播图</option>
			  <option value="热门商品">热门商品</option>
			  <option value="最新商品">最新商品</option>
			</select>
			</div>
	</div>
	
	
	<div class="">
			<label>广告链接 </label>
				<div class="">
					<input id="iUrl" name="iUrl" placeholder="广告链接" type="text" value="" >
				</div>
	</div>
	
								
</div>
<div style="float:left;margin-top:40px;margin-left:35px">
	<!-- 商品图片 -->
	<div >
		<label class="" > 广告图片</label>
		<div class="">
            <div>
				<div class="" style="width: 200px; height: 150px;">
					<input type="file" id="file" name="file">
				</div>
			</div>
		</div>
	</div>

	<!-- 商品描述 -->
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
   	var img = document.getElementById("file");
	var imgFile = img.files[0];
	/*图片类型正则验证*/
	var imgStr = /\.(jpg|jpeg|png|bmp|BMP|JPG|PNG|JPEG)$/;
	if (document.getElementById("iName").value=="" ||document.getElementById("iSName").value==""
   	    ||document.getElementById("iUrl").value==""){
   	    alert('填写格式错误!');
   	    return false;
  	}else if(img.value == ""){
		alert("请上传图片!");
		return false;
	}else if (!imgStr.test(imgFile.name)){
		alert("上传的广告图片不是图片格式!");
		return false;
	}else{
			alert('提交成功!');
			$("#myform").submit();
		}
}
</script>
</html>