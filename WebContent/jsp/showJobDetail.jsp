<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Job Detail</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	</head>
	<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
	<body onload = "javascript:updateDisplaySize()">

		<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width=100% height=700 cellpadding="0" cellspacing="0" class=centerTable>
    		<tr valign=top>
    			<td width=20%><jsp:include page="left.jsp" /></td>
				<td width=80% height=100% bgcolor=#FFFFFF style="padding:8px">
					<div class=daohang>Job Details<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Job Details</font></div>
					<form name="appliedform" action="${pageContext.request.contextPath}/AppliedServlet" method="post">
				<table class="listFile" cellspacing=1 id="appliedList">
				<caption>Job Details</caption>
				<tbody>
					<tr>
						<th>Job Name</th>
						<td>${job.jobName }</td>		
					</tr>
					
					<tr>
						<th>Employer</th>
						<td>${job.employer }</td>		
					</tr>
					
					<tr>
						<th>Opening</th>
						<td>${job.opening }</td>		
					</tr>
					
					<tr>
						<th>Position Type</th>
						<td>${job.type}</td>		
					</tr>
					
					<tr>
						<th>Deadline</th>
						<td>${job.deadline}</td>		
					</tr>
					
					<tr>
						<th>Location</th>
						<td>${job.location}</td>		
					</tr>
					
					<tr>
						<th>Document Requirement</th>
						<td>${job.docReq}</td>		
					</tr>
					
					<tr>
						<th>Compensation</th>
						<td>${job.compensation}</td>		
					</tr>
					
					<tr>
						<th>Salary</th>
						<td>${job.salary}</td>		
					</tr>
					
					<tr>
						<th>Description</th>
						<td><div style="white-space:normal; width:100%;">${job.getDes()}</div></td>		
					</tr>
					<tr>
						<th>Action</th>
						<td><a href="${pageContext.request.contextPath}/AppliedServlet?id=1&jobId=${job.jobID}&link=${job.other}">APPLY</a></td>		
					</tr>
				</tbody>					
			</table>				<br />
			</form>
					
					
					
					<br />
					<br />
				</td>
			</tr>
		</table>
		<jsp:include page="footer.jsp" />
	</body>
</html>