<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Add a new request</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
		<script language="javascript" src="${pageContext.request.contextPath}/js/addValidate.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath}/js/multioption.js"></script>
	</head>
	<body onload = "javascript:updateDisplaySize()">
	<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
			<td width="20%"><jsp:include page="left.jsp" /></td>
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
							<textarea name="content" rows="3"></textarea>
						</td>
					</tr>
					<tr>
						<th >To</th>
						<td>
							<select id="request_selectPro" name="owner" tabindex="6"></select>
						</td>
					</tr>
					<tr>
						<th >Forward</th>
						<td>
							<table width=100% cellspacing=0 cellpadding=0 border=0   class=addFile2>
										<tr>
											<th>
												<center>
													Users
												</center>
												<select name="list1" multiple size=8
													ondblclick="moveOption(1,document.formx.list1, document.formx.list2)">
													<c:forEach var="user" items="${users}">
																<option value="${user.email}">
																	${user.email}
																</option>
													</c:forEach>
												</select>
											</th>
											<th style="padding: 0 10px;">
												<input type="button" style="cursor: pointer;"
													value="&nbsp;>&nbsp;"
													onclick="moveOption(1,document.formx.list1, document.formx.list2)" />
												<br />
												<br />
												<input type="button" style="cursor: pointer;"
													value="&nbsp;<&nbsp;"
													onclick="moveOption(1,document.formx.list2, document.formx.list1)" />
											</th>
											<th align="center">
												<center>
													Selected User(s)
												</center>
												<select multiple size=8 name="list2"
													ondblclick="moveOption(1,document.formx.list2, document.formx.list1)"></select>
												<script>moveOption(1,document.formx.list1, document.formx.list2)</script>
												<input type="hidden" name="utv" value="">
											</th>
										</tr>
									</table>
						</td>
					</tr>
					<tr>
						<th >Due Date:</th>
						<td width="200px">
							<input type="text"  id="requesttime" name="requesttime">&nbsp;&nbsp;<input type="text" name="requestdatetime" id="requestdatetime">&nbsp;&nbsp;<script type="text/javascript">OutputLoc()</script>
						</td>
					</tr>
					<tr>
						<th >To public</th>
						<td>
							<input type="checkbox" name="isPublic" id="is_public" checked="checked"> (If you want to share this request flow to all users, please check box.)
						</td>
					</tr>
					</table>
					<br />
					<center>
						<input type="submit" class="button" value="Confirm" onclick="return validate();">
						&nbsp;
						<input type="reset"  class="button" value="Reset" >
					</center>
					<input type="hidden" name="gap" id="gap" value=""/>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/request.js" ></script>
	</body>
</html>
