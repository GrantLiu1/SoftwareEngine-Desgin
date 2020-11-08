<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人信息</title>
<style type="text/css">
.btn{
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

</head>

<body style="margin:0px; padding:0px; background-color: #FFF">
<form action="${pageContext.request.contextPath}/user?method=update_info" method="post">
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
      <td height="60">
      	<input type="text" name="nickName" id="nickName" value="${user.nickName }" style="font-size: 16px;">
      </td>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">身份证</td>
      <td height="60">${user.IDNum }</td>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">手机号</td>
      <td height="60">
      	<input type="text" name="phone" id="phone" value="${user.phone }" style="font-size: 16px;">
      </td>
    </tr>
    <tr>
      <td height="60" align="center" valign="middle">身份</td>
      <td height="60">
      	<c:if test="${!user.userType}">
			<c:if test="${!user.uCheck}">买家 </c:if>
      		<c:if test="${user.uCheck}">（卖家身份审核中）</c:if>
		</c:if>
      	<c:if test="${user.kuserType}">卖家（已认证卖家身份）</c:if>

          <c:if test="${!user.kuserType}">
              <c:if test="${!user.kCheck}"> <a href="${pageContext.request.contextPath}/user?method=updatekCheck"><input type="button" value="快递员申请" class="btn"/></a></c:if>
              <c:if test="${user.kCheck}">（快递员身份审核中）</c:if>
          </c:if>
          <c:if test="${user.kuserType}">快递员（已认证快递员身份）</c:if>
      </td>
    </tr>
    <tr>
      <td height="150" align="right"><input type="submit" value="确认修改" class="btn"></td>
      <td height="150" style="text-align: right;"></td>
    </tr>
</table>
</form>

</body>
</html>