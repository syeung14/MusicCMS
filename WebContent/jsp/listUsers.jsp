<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>List All Users</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="text-align: center;">
  <div id="dw">
		<iframe id="updaterequest"  src="" width="400px" height="170px" frameborder="0" style="display:none;border:1px solid #448ACF;"scrolling="no"></iframe>
	</div>
	<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
				<td width="20%"><jsp:include page="left.jsp" /></td>
				<td width="80%" height=600 bgcolor=#FFFFFF style="padding:2px;">
				<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>List My CV</font></div>
   <table class="listFile" cellspacing=1 id="listRequest">
   <caption>Users List</caption>
   <thead>
   	<tr align=center>
   	<td>ID</td>
   	<td>Name</td>
   	<td>Password</td>
   	<td>Email</td>
   	<td>isAdmin</td>
   	<td>LoginCount</td>
   	<td>Create Time</td>  	
   	</tr>
   	</thead>
   	<tbody>
   	<c:forEach var="user" items="${page.list}">
   		<tr align=center>
   			<td>${user.userId}</td>
   			<td>${user.userName}</td>
   			<td>${user.password}</td>
   			<td>${user.userEmail}</td>
   			<td>${user.isAdmin}</td>
   			<td>${user.loginCount}</td>
   			<td>${user.createTime}</td>
   			<td><a href="${pageContext.request.contextPath}/DeleteUserServlet?userId=${user.userId}&pagenum=<c:if test='${empty pagenum}'>1</c:if><c:if test='${not empty pagenum}'>${pagenum}</c:if>" onclick="return confirm('Are you sure to delete the user?');">delete</a>
			</td>  	
   	</tr>
   	</c:forEach>
   	</tbody>
   </table>
   <div align=center>
   <c:forEach var="pagenum" begin="1" end="${page.totalpage}">  
   	<a href="${pageContext.request.contextPath}/ListAllServlet?pagenum=${pagenum}" >${pagenum}</a> 
   </c:forEach>
    </div>
  </body>
</html>
