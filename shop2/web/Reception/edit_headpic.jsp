<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头像编辑</title>
<style type="text/css">
.btn{
	width:70px; 
	height:30px; 
	color: white; 
	text-align:center;
	font-size:12px;
	background-color:#666;
	cursor:pointer;
	border:none;
	border-radius:2px;
	margin:1px;
}
</style>
</head>
<body>
	<form  id="myform" target="_parent" action="${pageContext.request.contextPath }/fileUpload?method=userPic" method="post" enctype="multipart/form-data">
		<input type="file" id="headPic" name="headPic">
		<input type="submit" value="上传"  id = "go" class="btn">
	</form>
</body>
<script>
	document.getElementById("go").onclick = function(){
	   	var img = document.getElementById("headPic");
		var imgFile = img.files[0];
		/*图片类型正则验证*/
		var imgStr = /\.(jpg|jpeg|png|bmp|BMP|JPG|PNG|JPEG)$/;
		if(img.value == ""){
			alert("请上传图片!");
			return false;
		}else if (!imgStr.test(imgFile.name)){
			alert("上传的文件不是图片格式!");
			return false;
		}else{
  			alert('修改成功!');
  			$("#myform").submit();
  		}
	}
</script>
</html>