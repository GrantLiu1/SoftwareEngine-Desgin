<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>个人信息</title>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<style type="text/css">
.btn,.btn-upd{
	width:90px; 
	height:38px; 
	color: white; 
	text-align:center;
	font-size:14px;
	background-color:#999;
	cursor:pointer;
	white-space:nowrap;
	display:inline-block;
	border:none;
	border-radius:2px;
	margin-right:10px;
}
</style>
<script>
function check() {
	if(document.getElementById("new_pwd1").value==""){
		alert('密码不能为空!');
		return false;
	}if(document.getElementById("new_pwd1").value!=document.getElementById("new_pwd2").value){
		alert('两次密码不同!');
		return false;
	}else
		return true;
}

$(function() {
 	$("#dialog_1").dialog({
      height: 230,
      width: 450,
      resizable: false,
      modal: true,
      autoOpen: false,
      show: {
        effect: "clip",
        duration: 200
      },
    });
    
    $(".btn-upd").click(function() {
		$("#dialog_1").dialog( "open" );
	});
 });
</script>
</head>

<body style="margin:0px; padding:0px; background-color: #FFF">
<table width="100%" border="0" style="font-size: 13px;">
    <tr>
      <th width="165" height="80" style="text-align: center; scope="col">个人信息</th>
      <th width="625" height="80" style="text-align: right; scope="col">
      	
      </th>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">用户名</td>
      <td height="60">${user.userName }</td>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">昵称</td>
      <td height="60">${user.nickName }</td>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">身份证</td>
      <td height="60">${user.IDNum }</td>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">手机号</td>
      <td height="60">${user.phone }</td>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">卖家身份</td>
      <td height="60">
      	<c:if test="${!user.userType}">
			<c:if test="${!user.uCheck}">买家 <a href="${pageContext.request.contextPath}/user?method=updateuCheck"><input type="button" value="卖家申请" class="btn"/></a></c:if>
      		<c:if test="${user.uCheck}">（卖家身份审核中）</c:if>
        </c:if>
      	<c:if test="${user.userType}">卖家（已认证卖家身份）</c:if>
      </td>
    </tr>
    <tr>
        <td height="60" align="center" valign="middle">快递员身份</td>
        <td height="60">
            <c:if test="${!user.kuserType}">
                <c:if test="${!user.kCheck}">买家 <a href="${pageContext.request.contextPath}/user?method=updatekCheck"><input  type="button" value="快递员申请" class="btn"/></a></c:if>
                <c:if test="${user.kCheck}">（快递员身份审核中）</c:if>
            </c:if>
            <c:if test="${user.kuserType}">快递员（已认证快递员身份）</c:if>

        </td>
        <td >
            <c:if test="${user.kuserType}">
                <a id="kauidi" href="${pageContext.request.contextPath}/recryit/index.html" style="display: block"><input type="button" value="快递员招聘网" class="btn"/></a>
                <a href="${pageContext.request.contextPath}/recryit/k_deliverOrder.jsp"><input type="button" value="查看任务清单" class="btn"/></a>
                </li>
            </c:if>
        </td>
    </tr>
    <tr>
      <td height="150" align="right"><a href="user_info_edit.jsp"><input type="button" value="修改信息" class="btn"></a></td>
      <td height="150" align="left">
			<input type="button" value="修改密码" class="btn-upd"/>
	  </td>
    </tr>
</table>

<div id="dialog_1" title="修改密码">
	<form target="_parent" action="${pageContext.request.contextPath}/user?method=update_PWD" method="post" onSubmit="return check()">
		<table border="0">
		  <tr>
		    <td width="80" height="30" align="right" valign="middle">新密码：</td>
		    <td width="150" height="30" valign="middle">
		    	<input type="text" name="new_pwd1" id="new_pwd1">
		    </td>
		    <td width="100" height="30" valign="middle">&nbsp;</td>
		  </tr>
		  <tr>
		    <td width="80" height="30" align="right" valign="middle">确认密码：</td>
		    <td width="150" height="30" valign="middle">
		    	<input type="text" name="new_pwd2" id="new_pwd2">
		    </td>
		    <td width="100" height="30" valign="middle">&nbsp;</td>
		  </tr>
		  <tr>
		    <td width="80" height="50" valign="middle">&nbsp;</td>
		    <td width="150" height="50" valign="middle">&nbsp;</td>
		    <td width="100" height="50" valign="middle">
		    	<input type="submit" class="btn" value="提交">
		    </td>
		  </tr>
		</table>
	</form>
</div>
</body>
</html>