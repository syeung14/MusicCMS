<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Add a user</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<script language="javascript" src="../js/addValidate.js"></script>
	</head>
	<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
	<body>
	<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
			<td width="20%"><jsp:include page="left.jsp" /></td>
			<td width="80%" height="600" bgcolor=#FFFFFF  style="padding:2px;">
				<table width="100%" align="center" border="0" cellpadding="0" cellspacing="2">
						<tr>
							<td>
								<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Add a new user</font> </div>
							</td>
						</tr>							
				</table>							
				<form name="formx" method="post" action="${pageContext.request.contextPath}/AddUserServlet">
					<table class=addFile cellspacing=1 cellspacing="2" align=center>
					<caption>Add a new user</caption>
					<tr>
						<th >User name</th>
						<td>
							<input type="text"  name="name"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Password</th>
						<td>
							<input type="password"  name="password"   class=inputForm>
						</td>
						</tr>
					<tr>
						<th >Confirm Password</th>
						<td>
							<input type="password"  name="repassword"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Email</th>
						<td>
							<input type="text"  name="email" class=inputForm>
						</td>
					</tr>
					<tr>
					</table>
					<br />
					<center>
						<input type="submit" class="button" value="Confirm" onclick="return validate();">
						&nbsp;
						<input type="reset"  class="button" value="Reset" >
					</center>
				</form>
				<c:if test="${not empty message}">
					<center>
					<div style="color:red"> ${message}</div>
					 </center>
					 <c:remove var="message" scope="session"/>
				</c:if>
			</td>
		</table>
		<jsp:include page="footer.jsp" />
	</body>
</html>
