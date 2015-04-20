<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>User List</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</head>
	<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
	<body>
	<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
				<td width="20%"><jsp:include page="left.jsp" /></td>
				<td width="80%" height=600 bgcolor=#FFFFFF style="padding:2px;">
				<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Check User List</font></div>
			<c:if test="${not empty userList }">
			<form name="userform" action="${pageContext.request.contextPath}/admin/removeUser.do" method="post">
				<table class="listFile" cellspacing=1 id="listUser">
				<caption>User List</caption>
				<thead>
					<tr>
						<th>name</th>
						<th>Email</th>
						<th>Add Date</th>
						<th>action</th>
					</tr>
				</thead>
				<tbody>	
				<c:forEach items="${userList}" var="user" >	
					<tr align=center>						
						<td>${user.name }</td>
						<td >${user.email }</td>
						<td ><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${user.date}" /></td>
						<td>
						<a href="${pageContext.request.contextPath}/DeleteUserServlet?userId=${user._id}" onclick="return confirm('Are you sure to delete the user?');">delete</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>					
			</table>				<br />
			</form>
			</c:if>
			<c:if test="${empty userList}">
					<center>
						No User exists.
					</center>
			</c:if>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
		<script type="text/javascript">
				toreplace('listUser');
		</script>
	</body>
</html>
