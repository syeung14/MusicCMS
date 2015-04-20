<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>Request List</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</head>
	<script type="text/javascript">
			function mouseCoords(event){  
			    if(event.pageX || event.pageY){  
			        return {x:event.pageX, y:event.pageY};  
			    }  
			    return {  
			        x:event.clientX + document.body.scrollLeft - document.body.clientLeft,  
			        y:event.clientY + document.documentElement.scrollTop  - document.documentElement.clientTop  
			    };  
			}  
			function Wopen(id,event)
			{
				var divst=document.getElementById('updaterequest');
				var dw=document.getElementById('dw');
				if(divst.style.display=='none')
				{			
					dw.style.position='absolute';
					arr=mouseCoords(event);
					dw.style.top=arr.y-50;
					dw.style.left=arr.x-450;

					divst.style.display='block';
					divst.src='${pageContext.request.contextPath}/jsp/updateRequest.jsp?rid='+id;
				}
				else
				{
					divst.style.display='none';
				}
			}
		</script>
	<body>
	<div id="dw">
		<iframe id="updaterequest"  src="" width="400px" height="170px" frameborder="0" style="display:none;border:1px solid #448ACF;"scrolling="no"></iframe>
	</div>
	<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
				<td width="20%"><jsp:include page="left.jsp" /></td>
				<td width="80%" height=600 bgcolor=#FFFFFF style="padding:2px;">
				<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Check Request List</font></div>
			<c:if test="${not empty requestList }">
			<form name="userform" action="${pageContext.request.contextPath}/admin/removeUser.do" method="post">
				<table class="listFile" cellspacing=1 id="listRequest">
				<caption>Request List</caption>
				<thead>
					<tr>
						<th>name</th>
						<th>Content</th>
						<th>To</th>
						<th>Creator</th>
						<th>Create date</th>
						<th>Due Date</th>
						<c:choose> 
							<c:when test="${empty who or who eq 'others'}">
							</c:when>
							<c:otherwise> 
							<th>Action</th>	
							</c:otherwise>
						</c:choose>
						
					</tr>
				</thead>
				<tbody>	
				<c:forEach items="${requestList}" var="request" >	
					<tr align=center>						
						<td>${request.name }</td>
						<td >${request.content }</td>
						<td >${request.owner}</td>
						<td>${request.creator}</td>
						<td ><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${request.createtime}" /></td>
						<td ><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${request.endtime}" /></td>
						<c:if test="${who eq 'tome'}">
							<td>
							<c:if test="${request.status eq 2 or request.status eq 1}">
								<a href="javascript:void(0);" onclick="Wopen('${request._id}',event);">update</a> 
							</c:if>
							<c:if test="${request.status eq 3}">
								<a href="${pageContext.request.contextPath}/ShowRequestLogServlet?requestId=${request._id}" target="_blank">details</a> 
							</c:if>
							</td>
						</c:if>
						<c:if test="${who eq 'fromme'}">
							<td>
								<a href="${pageContext.request.contextPath}/DeleteRequestServlet?requestId=${request._id}&who=${who}" onclick="return confirm('Are you sure to delete the request?');">delete</a>
							</td>
						</c:if>
						<c:if test="${empty who or who eq 'others'}">
						</c:if>
					</tr>
				</c:forEach>
				</tbody>					
			</table>				<br />
			</form>
			</c:if>
			<c:if test="${empty requestList}">
					<center>
						No Request exists.
					</center>
			</c:if>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
		<script type="text/javascript">
				toreplace('listRequest');
		</script>
	</body>
</html>
