<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/effect.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ui.datepicker.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.ptTimeSelect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ui.theme.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/timezone.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ptTimeSelect.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datapicker.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/highcharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/tab.js"></script>
	<div id=head_main>
		<div id="showmessage" style="width:50px;float:left;margin-left:200px;margin-top:40px;"></div> 	
		<c:if test="${not empty user}">
 			<div style="float:right;vertical-align:top;padding:8px 4px">Welcome，${user.userName}
 				Your Identity is：<c:if test="${user.isAdmin eq 1}">Admin</c:if><c:if test="${user.isAdmin ne 1}">Common User</c:if>[<a href="${pageContext.request.contextPath}/LogoutServlet" >Logout</a>]<br>
 				<div style="clear:both;height:10px;"></div>
 		   </div>
 		</c:if>	    
 	</div>

