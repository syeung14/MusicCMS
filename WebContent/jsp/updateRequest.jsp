<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>Request Modification</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css">
		<script type="text/javascript">
			function validate()
			{
				var spendtime=document.getElementById("spendtime");
				if(spendtime.value.length==0)
				{
					alert('Please input spend time');
					spendtime.focus();
					return false;
				}
				return true;
			}
			function cancel()
			{
				parent.document.getElementById("updaterequest").style.display="none";
			}
		</script>
	</head>
	 <body style="background-color:#F0F7FF;border:1px solid #448ACF;">
	  	<form action="${pageContext.request.contextPath}/UpdateRequestServlet" method="get" style="margin:15px 5px;">
	  		<table>
	  			<tr>
	  				<td>Spend Time：</td>
	  				<td><input id="spendtime" type="text" name="spendtime"/>(hours)</td>
	  			</tr>
		   		<tr>
	  				<td>Status：</td>
	  				<td>	<select name="status">
			 			 		<option value ="2" selected>In progress</option>
			  					<option value ="3">Done</option>
							</select>
					</td>
	  			</tr>
	  			<tr>
	  				<td>Comments:</td>
	  				<td>	
	  					<textarea name="content" rows="3"></textarea>
					</td>
	  			</tr>
		   	</table>
		   	<div style="clear:both;height:10px;"></div>
		   	<input type="hidden" name="requestId" value="${param.rid}"/>
		   	<input type="submit" value="Update" onclick="return validate();" class="button"/>
		   	<input type="reset" value="Cancel" onclick="cancel();" class="button"/>
	   	</form>
   	</body>
</html>
