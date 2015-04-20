<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>Request Log List</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css">
		<script language="javascript" src="${pageContext.request.contextPath}/js/timezone.js"></script>
	</head>
	<body>
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<c:if test="${not empty logs }">
				<table class="listFile" cellspacing=1 id="listRequestlog">
				<caption>Request Log List</caption>
				<thead>
					<tr>
						<th>Create time</th>
						<th>Spend time(hours)</th>
						<th>Comments</th>
					</tr>
				</thead>
				<tbody>	
				<c:forEach items="${logs}" var="log" >	
					<tr align=center>						
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${log.createdate}" /></td>
						<td >${log.time}</td>
						<td >${log.comment}</td>
					</tr>
				</c:forEach>
				</tbody>					
			</table>				<br />
			</c:if>
			<c:if test="${empty logs}">
					<center>
						No Request log exists.
					</center>
			</c:if>
		</td>
	</tr>
</table>
		<script type="text/javascript">
				toreplace('listRequestlog');
		</script>
	</body>
</html>
