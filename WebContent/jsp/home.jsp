<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Backend</title>
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
					
					Welcome to Enterprise Request Management System! 
					<br />
					<br />
				</td>
			</tr>
		</table>
		<jsp:include page="footer.jsp" />
	</body>
</html>
