<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>Resume details List</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css">
		<script language="javascript" src="${pageContext.request.contextPath}/js/timezone.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
				<td width="20%"><jsp:include page="left.jsp" /></td>
				<td width="80%" height=600 bgcolor=#FFFFFF style="padding:2px;">
				<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Check Resume Details List</font></div>
					<c:if test="${not empty eduList }">
						<table class="listFile" cellspacing=1 id="listRequestlog">
						<caption>Education List</caption>
						<thead>
							<tr>
								<th>School Name</th>
								<th>Location</th>
								<th>School Type</th>
								<th>Begin Date</th>
								<th>End Date</th>
								<th>Average Grade</th>
								<th>Award</th>
							</tr>
						</thead>
						<tbody>	
						<c:forEach items="${eduList}" var="edu" >	
							<tr align=center>	
								<td>${edu.schoolName}</td>	
								<td >${edu.location}</td>	
								<td >${edu.schoolType}</td>				
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${edu.enrollmentDate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${edu.graduateDate}" /></td>
								<td >${edu.averageGrade}</td>
								<td >${edu.award}</td>
							</tr>
						</c:forEach>
						</tbody>					
					</table>				<br />
					</c:if>
					<c:if test="${empty eduList}">
							<center>
								No education records exists.
							</center>
					</c:if>
					<c:if test="${not empty projList }">
						<table class="listFile" cellspacing=1 id="listRequestlog">
						<caption>Project List</caption>
						<thead>
							<tr>
								<th>Project Name</th>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Number Of People</th>
								<th>Description</th>
							</tr>
						</thead>
						<tbody>	
						<c:forEach items="${projList}" var="proj" >	
							<tr align=center>	
								<td>${proj.projectname}</td>					
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${proj.pstartDate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${proj.pendDate}" /></td>
								<td >${proj.people}</td>
								<td >${proj.desc}</td>
							</tr>
						</c:forEach>
						</tbody>					
					</table>				<br />
					</c:if>
					<c:if test="${not empty expList }">
						<table class="listFile" cellspacing=1 id="listRequestlog">
						<caption>Experience List</caption>
						<thead>
							<tr>
								<th>Company Name</th>
								<th>Location</th>
								<th>Begin Date</th>
								<th>End Date</th>
								<th>Role</th>
								<th>Description</th>
							</tr>
						</thead>
						<tbody>	
						<c:forEach items="${expList}" var="exp" >	
							<tr align=center>	
								<td>${exp.companyname}</td>	
								<td >${exp.elocation}</td>	
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${exp.estartDate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${exp.eendDate}" /></td>
								<td >${exp.role}</td>
								<td >${exp.edesc}</td>
							</tr>
						</c:forEach>
						</tbody>					
					</table>				<br />
					</c:if>
					<c:if test="${not empty techList }">
						<table class="listFile" cellspacing=1 id="listRequestlog">
						<caption>Technique List</caption>
						<thead>
							<tr>
								<th>Technique Name</th>
								<th>Technique Type</th>
								<th>Proficiency Degree</th>
								<th>Time of Use</th>
							</tr>
						</thead>
						<tbody>	
						<c:forEach items="${techList}" var="tech" >	
							<tr align=center>	
								<td>${tech.techName}</td>	
								<td >${tech.techType}</td>	
								<td ><c:if test="${tech.prof eq '1'}">newbie</c:if>
								<c:if test="${tech.prof eq '3'}">intermediate</c:if>
								<c:if test="${tech.prof eq '9'}">expert</c:if></td>				
								<td >${tech.timeOfUse}</td>
							</tr>
						</c:forEach>
						</tbody>					
					</table>				<br />
					</c:if>
			</td>
		</tr>
	</table>
	<jsp:include page="footer.jsp" />
		<script type="text/javascript">
				toreplace('listRequestlog');
		</script>
	</body>
</html>
