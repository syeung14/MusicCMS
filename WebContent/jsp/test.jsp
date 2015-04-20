<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Add a new request</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<!--link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ui.datepicker.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ui.core.css" />


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.ptTimeSelect.css" />
<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js/timezone.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ptTimeSelect.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datapicker.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/request.js" ></script-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	</head>
	<body>
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
			<td width="20%"></td>
			<td width="80%" height="600" bgcolor=#FFFFFF  style="padding:2px;">
				<table width="100%" align="center" border="0" cellpadding="0" cellspacing="2">
						<tr>
							<td>
								<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Add a new request</font> </div>
							</td>
						</tr>							
				</table>							
				<form name="formx" method="post" action="${pageContext.request.contextPath}/AddRequestServlet">
					<table class=addFile cellspacing=1 cellspacing="2" align=center>
					<caption>Add a new request</caption>
					<tr>
						<th >Request name</th>
						<td>
							<input type="text"  name="name"  class=inputForm/>
						</td>
					</tr>
					<tr>
						<th >Content</th>
						<td>
							<textarea name="context" rows="3"></textarea>
						</td>
					</tr>
					<tr>
						<th >Owner</th>
						<td>
							<input type="password"  name="repassword"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Forward</th>
						<td>
							<input type="password"  name="repassword"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Due Date:</th>
						<td>
							<p><input type="text"  id="requesttime" name="requesttime"/><input type="text" name="requestdatetime" id="requestdatetime"/></p>
						</td>
					</tr>
					<tr>
						<th >To public</th>
						<td>
							<input type="checkbox" value="option2" name="is_public" id="is_public" checked="checked"> (If you want to share this request flow to all users, please check box.)
						</td>
					</tr>
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
		 <script type="text/javascript" src="${pageContext.request.contextPath}/js/request.js" ></script>
	</body>
</html>
