<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<title>Match Result</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="cache-control" content="max-age=0" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
		<meta http-equiv="pragma" content="no-cache" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	</head>
	<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
	<script type="text/javascript">
		function popup(link){
			if(link!=null&&link.trim().length>0){
				window.open(link,"_blank");
			}
		}
	</script>
	<body onload = "javascript:popup('${link}');">

		<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width=100% height=700 cellpadding="0" cellspacing="0" class=centerTable>
    		<tr valign=top>
    			<td width=20%><jsp:include page="left.jsp" /></td>
    			<td width="80%" height=600 bgcolor=#FFFFFF style="padding:2px;">
				
				<div class=daohang>Matched Jobs<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Jobs List</font></div>
			
			<c:if test="${empty ids}">
					<center>
						<h3>No jobs are suitable for you!</h3>
					</center>
			</c:if>
			
			<c:if test="${not empty ids}">
			<form name="appliedform" action="${pageContext.request.contextPath}/JobMatch" method="post">
				<table class="listFile" cellspacing=1 id="idd"  style="width:50%;">
				<caption>Matched Jobs List</caption>
				<thead>
					<tr>
						<th>Job</th>
					</tr>
				</thead>
				<tbody>	
				<c:forEach items="${ids}" var="id" >	
					<tr align=center>						
						<td><a href='ShowJob?jobID=${fn:substring(id,0,5)}'>${id}</a></td>
					</tr>
				</c:forEach>
				</tbody>					
			</table>				<br />
			</form>
			</c:if>
			
		</td>
    			
				
			</tr>
		</table>
		<jsp:include page="footer.jsp" />
	</body>
</html>