<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户登录</title>
    
    <link rel="stylesheet" type="text/css" href="Backstage/css/reset.css">
    <link rel="stylesheet" type="text/css" href="Backstage/css/login.css">
   
   <script type="text/javascript"> 
   function check(){
		if(!document.getElementById("username").value){alert("请输入管理员帐号！")}
		else if(!document.getElementById("password").value){alert("请输入管理员密码！")}
		else if(!document.getElementById("code1").value){alert("请输入验证码！")}
		else if(document.getElementById("code1").value==document.getElementById("code2").innerHTML){
			document.getElementById("form").submit();
		}else if(document.getElementById("code1").value!=document.getElementById("code2").innerHTML){
			alert("验证码错误！");
		}
	}

	 
  	function validatecode(n)
  	{ 	/*验证码中可能包含的字符*/
    	var s="0123456789";
    	var ret="";//保存生成的验证码
   		/*利用循环，随机产生验证码中的每个字符*/
		for(var i=0;i<n;i++)
		{
			var index=Math.floor(Math.random()*10);//随机产生一个0~36之间的数值 
			ret += s.charAt(index);//将随机产生的数值当作字符串的位置下标，在字符串s中取出该字符，并入ret中
		}
   		return ret;
   	}
  	
	function show()
  	{ 
   		document.getElementById("code2").innerHTML=validatecode(4); 
   	}
   	window.onload=show;
  //bgcolor="#e2e2e2"
   </script>
  </head>
  
  <body style="background-image:url('./images/bg.jpg');">
     <div id = "login">
     	  <div id = "title">
     	  		后台管理系统
     	  </div>
     	  <div id="form_div">
     	  	<form id="form" method="post" action="${pageContext.request.contextPath}/user?method=login_admin">
     	  		<div style="margin-top: 20px">
     	  			<input type= "text" name = "username" id = "username" style="width:200px;height:30px;margin-bottom:15px;font-size:15px" placeholder=" 请输入帐号"/>
	     	  		<br>
	     	  		<input type= "password" name = "password" id = "password" style="width:200px;height:30px;margin-bottom:15px;font-size:15px"  placeholder=" 请输入密码"/>
	     	  		<br>
		     	    <input type= "text" name = "code" id = "code1" style="width:140px;margin-right:14px;height:30px;margin-bottom:20px;font-size:15px"  placeholder=" 请输入验证码"/>
		     	  	<label id="code2" onClick="show()" style="font-style:italic"></label>
		     	  	<br>
		     	    <input type= "button" value="登&nbsp;录" class="btn" onClick="check()"/>
     	  		</div>
     	  		
     	 	</form>
     	  </div>
     </div>
  </body>
</html>
