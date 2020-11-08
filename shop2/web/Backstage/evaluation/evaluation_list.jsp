<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="com.shop.dao.EvaluationDao,com.shop.entity.Evaluations"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评价列表</title>
	<link rel="stylesheet" type="text/css" href="../css/main-middle.css">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</head>
<script>
    function searchComplaints(){
	  var xmlhttp; 
	  var key=document.getElementById("key_code").value;   
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
	       document.getElementById("EvaluationList").innerHTML=xmlhttp.responseText;
	    }
	  }
	  xmlhttp.open("GET","../ajax/searchEvaluation.jsp?key="+key,false);
	  xmlhttp.send();
	}
    
    $(function() {
    	$("#dialogDelete").dialog({
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
  
    	 $(document).on('click', '.btn-delete', function () {
 	    	var xmlhttp; 
 		  	var key=$(this).parent().parent().children().first().text().trim(); 
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
		       		document.getElementById("delete").innerHTML=xmlhttp.responseText;
		    	}
		  	}
 		    xmlhttp.open("GET","../ajax/deleteEvaluation.jsp?key="+key,false);
 		  	xmlhttp.send();  
 			$("#dialogDelete").dialog( "open" );
 		});
    	 $(document).on('click', '.cancel', function () {
    		 $("#dialogDelete").dialog( "close" );
    	 });
 	 });
</script>

<body>
 <div id="top">
    	<div id="top-letf">评价列表</div>
    </div>
    <div id="middle">
        <input name="key_code" type="text" id="key_code" placeholder="请输入评价编码" class="textfild">
	    <button class="btn" onClick="searchComplaints()">查找评价</button>
     <table id="EvaluationList" border="1" cellspacing="0" style="border-collapse:collapse; border-width:thin; border-style:solid; margin-top:10px;">
         <tr>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">评价编码</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">商品编码</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">评价内容</td>
           <td width="200" height="35" align="center" valign="middle" bgcolor="#DDD">创建时间</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">买家编号</td>
           <td width="100" height="35" align="center" valign="middle" bgcolor="#DDD">操作</td>
         </tr>
  		 <%
            EvaluationDao evaluationDaoImpl = new EvaluationDao();
            List<Evaluations> list=evaluationDaoImpl.selectAllEvaluations();
            for(Evaluations e:list)
         {%>
         <tr>
           <td width="100" height="40" align="center" valign="middle"><%=e.geteID()%></td>
           <td width="100" height="40" align="center" valign="middle"><%=e.getgID()%></td>
           <td width="200" height="40" align="center" valign="middle"><%=e.geteContent()%></td>
           <td width="200" height="40" align="center" valign="middle"><%=e.geteTime()%>
           <td width="100" height="40" align="center" valign="middle"><%=e.getUserID()%></td>
           <td width="100" align="center" valign="middle">
   		     <button class="btn-delete">删除</button>
           </td>
         </tr>
         <%}%>
       </table>
	</div>

	<div id="dialogDelete" title="是否确认删除?" style="display:none">
		<form action="${pageContext.request.contextPath}/evaluation?method=delEva_admin" method="post" style="text-align:center">
			<div id="delete" align="center"></div>
			<input type="submit" value="确定">
			<input type="button" class="cancel" style="margin-right:10px" value="取消">
		</form>
	</div>
</body>
</html>