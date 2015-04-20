<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>Resume List</title>
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
				<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>List My CV</font></div>
			<c:if test="${not empty resumes }">
			<form name="userform" action="${pageContext.request.contextPath}/admin/removeUser.do" method="post">
				<table class="listFile" cellspacing=1 id="listRequest">
				<caption>Request List</caption>
				<thead>
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Content name</th>
						<th>Email</th>
						<th>Create date</th>
						<th>Address</th>
						<th>Action</th>
						
					</tr>
				</thead>
				<tbody>	
				<c:forEach items="${resumes}" var="resume" >	
					<tr align=center>						
						<td>${resume.resumeName }</td>
						<td >${resume.resumeType }</td>
						<td >${resume.contentName}</td>
						<td>${resume.email}</td>
						<td ><fmt:formatDate pattern="yyyy-MM-dd" value="${resume.createTime}" /></td>
						<td>${resume.address}</td>
						<td><a href="${pageContext.request.contextPath}/ShowMyResumesDetailsServlet?resumeid=${resume.resumeID}">details</a></td>
					</tr>
				</c:forEach>
				</tbody>					
			</table>				<br />
			</form>
			</c:if>
			<c:if test="${empty resumes}">
					<center>
						No Resume exists.
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
