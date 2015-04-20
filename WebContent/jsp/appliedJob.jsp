<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Applied Jobs</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
	<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
<body onload = "javascript:updateDisplaySize()">
	<jsp:include page="header.jsp" />
	 
	<table id="mainTableInThisPage" width="100%" border="0" cellpadding="0" cellspacing="0" height="60" class=centerTable>
			<tr valign="top">
				<td width="20%"><jsp:include page="left.jsp" /></td>
				<td width="80%" height=600 bgcolor=#FFFFFF style="padding:2px;">
				
				<div class=daohang>Applied Jobs<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Applied Jobs List</font></div>
			<c:if test="${not empty appliedList }">
			<form name="appliedform" action="${pageContext.request.contextPath}/AppliedServlet" method="post">
				<table class="listFile" cellspacing=1 id="appliedList">
				<caption>Applied Jobs List</caption>
				<thead>
					<tr>
						<th>Job Name</th>
						<th>Employer</th>
						<th>Location</th>
						<th>Position Type</th>
						<th>Salary</th>
						<th>Apply Date</th>
					</tr>
				</thead>
				<tbody>	
				<c:forEach items="${appliedList}" var="appliedList" >	
					<tr align=center>										
						<td><a href='ShowJob?jobID=${appliedList.getJobID()}'>${appliedList.jobName }</a></td>
						<td>${appliedList.employer }</td>
						<td>${appliedList.location}</td>
						<td>${appliedList.positionType}</td>
						<td>${appliedList.salary}</td>
						<td>${appliedList.applyDate }</td>
					</tr>
				</c:forEach>
				</tbody>					
			</table>				<br />
			</form>
			</c:if>
			<c:if test="${empty appliedList}">
					<center>
						<h3>You didn't apply any jobs so far.</h3>
					</center>
			</c:if>
		</td>
	
	</tr>
</table>

	<jsp:include page="footer.jsp" />
</body>
</html>