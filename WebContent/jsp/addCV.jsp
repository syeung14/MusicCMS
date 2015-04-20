<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Add a CV</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<script language="javascript" src="../js/addValidate.js"></script>
	</head>
	<script language="javascript" src="${pageContext.request.contextPath}/js/height.js"></script>
	<script type="text/javascript">
		function removeNew(table,self){
			document.getElementById(table).parentNode.removeChild(document.getElementById(table));
			if(document.getElementById("tb1").parentNode.children.length==1){
				document.getElementById("ad1").style.display="block";
			}
		}
		function removeNew2(table,self){
			document.getElementById(table).parentNode.removeChild(document.getElementById(table));
			if(document.getElementById("tt1").parentNode.children.length==1){
				document.getElementById("adt1").style.display="block";
			}
		}
		function removeNew3(table,self){
			document.getElementById(table).parentNode.removeChild(document.getElementById(table));
			if(document.getElementById("tp1").parentNode.children.length==1){
				document.getElementById("adp1").style.display="block";
			}
		}
		function removeNew4(table,self){
			document.getElementById(table).parentNode.removeChild(document.getElementById(table));
			if(document.getElementById("te1").parentNode.children.length==1){
				document.getElementById("ade1").style.display="block";
			}
		}
		function openNew(table,self){
			var tb=document.createElement("Table");
			var num=table.substring(2,tb.length);
			var newnum=parseInt(num)+1;
			tb.setAttribute("id","tb"+newnum);
			//alert(newnum);
			tb.innerHTML="<tr><th>SchoolName</th><td><input type='text'  name='schoolname"+newnum+"' class=inputForm>"+
				"</td></tr><tr><th>Location</th><td><input type='text'  name='location"+newnum+"' class=inputForm>"+
				"</td></tr><tr><th>SchoolType</th><td><select name='schooltype"+newnum+"'>"+
				"<option value='university'>University</option>"+
				"<option value='highschool'>high school</option>"+
			    "<option value='middleschool'>middle school</option>"+
				"<option value='primaryschool'>primary school</option>"+
				"</select></td></tr><tr><th>Start Date</th><td>"+
				"<input type='text' name='enrollmentDate"+newnum+"' class=inputForm>"+
				"</td></tr><tr><th>End Date</th><td>"+
			    "<input type='text'  name='graduateDate"+newnum+"' class=inputForm>"+
				"</td></tr><tr><th>GPA</th><td>"+
				"<input type='text'  name='averageGrade"+newnum+"' class=inputForm>"+
				"</td></tr><tr><th>Award</th><td><textarea name='award"+newnum+"' rows='4' cols='50'>"+
				"</textarea></td></tr><tr><th ></th><td>"+
				"<a id=\"rm"+newnum+"\" href=\"javascript:void(0)\" style=\"display:none;float:right;\" onclick=\"javascript:removeNew('tb"+newnum+"',this);\">delete</a>"+
				"<a href='javascript:void(0)' onclick='javascript:openNew(\"tb"+newnum+"\",this);'>add another education</a>"+
				"</td></tr>";
			document.getElementById(table).parentNode.appendChild(tb);
			self.style.display="none";
			var rn="rm"+newnum;
			document.getElementById(rn).style.display="block";
		}
		function openNew2(table,self){
			var tb=document.createElement("Table");
			var num=table.substring(2,tb.length);
			var newnum=parseInt(num)+1;
			tb.setAttribute("id","tt"+newnum);
			tb.innerHTML="<table id=\"tt"+newnum+"\" style=\"display:block\"><tr><th>TechType</th>"+
			"<td><select name=\"techtype"+newnum+"\">"+
			"<option value=\"Database\">Database</option>"+
			"<option value=\"Software\">Software</option>"+
			"<option value=\"Operating Systems\">Operation System</option>"+
			"<option value=\"Programming Language\">Programming Language</option>"+
			"<option value=\"Application Servers\">Application Servers</option>"+
			"</select></td></tr><tr><th>TechName</th><td><select name=\"techname"+newnum+"\">"+
			"<option value=\"Mysql\">Mysql</option><option value=\"Oracle\">Oracle</option>"+
		    "<option value=\"DB2\">DB2</option><option value=\"Bugzilla\">Bugzilla</option>"+
			"<option value=\"Redmine\">Redmine</option><option value=\"Jenkins\">Jenkins</option>"+
			"<option value=\"Jria\">Jria</option><option value=\"Unix\">Unix</option>"+
			"<option value=\"Linux\">Linux</option><option value=\"Mac\">Mac</option>"+
			"<option value=\"Windows\">Windows</option><option value=\"Java\">Java</option>"+
			"<option value=\"C\">C</option><option value=\"C++\">C++</option>"+
			"<option value=\"Ruby\">Ruby</option><option value=\"Python\">Python</option>"+
			"<option value=\"Tomcat\">Tomcat</option><option value=\"Jboss\">Jboss</option>"+
			"<option value=\"Weblogic\">Weblogic</option><option value=\"WebSphere\">WebSphere</option>"+
			"<option value=\"Resin\">Resin</option></select></td></tr><tr><th >Proficiency</th><td>"+
			"<select name=\"prof"+newnum+"\"><option value=\"9\">expert</option><option value=\"3\">intermediate</option>"+
			"<option value=\"1\">newbie</option></select></td></tr><tr><th >Time of Use</th><td>"+
			"<input type=\"text\"  name=\"timeofuse1\" class=inputForm> (month)</td></tr><tr><th ></th><td>"+
			"<a id=\"rmt"+newnum+"\" href=\"javascript:void(0)\" style=\"display:none;float:right;\" onclick=\"javascript:removeNew2('tt"+newnum+"',this);\">delete</a>"+
			"<a href=\"javascript:void(0)\" onclick='javascript:openNew2(\"tt"+newnum+"\",this);'>add another technique</a></td>"+
			"</tr></table>";
			document.getElementById(table).parentNode.appendChild(tb);
			self.style.display="none";
			var rn="rmt"+newnum;
			document.getElementById(rn).style.display="block";
		}
		function openNew3(table,self){
			var tb=document.createElement("Table");
			var num=table.substring(2,tb.length);
			var newnum=parseInt(num)+1;
			tb.setAttribute("id","tp"+newnum);
			tb.innerHTML="<table id=\"tp"+newnum+"\" style=\"display:block\"><tr><th >Project Name</th>"+
			"<td><input type=\"text\"  name=\"projectname"+newnum+"\" class=inputForm></td>"+
			"</tr><tr><th >Start Date</th><td><input type=\"text\"  name=\"pstartDate"+newnum+"\" class=inputForm>"+
			"</td></tr><tr><th >End Date</th><td><input type=\"text\"  name=\"pendDate"+newnum+"\" class=inputForm>"+
			"</td></tr><tr><th >People</th><td><input type=\"text\"  name=\"people"+newnum+"\" class=inputForm>"+
			"</td></tr><tr><th >Description</th><td><textarea name=\"desc"+newnum+"\" rows=\"4\" cols=\"50\"></textarea>"+ 
			"</td></tr><tr><th ></th><td>"+
			"<a id=\"rmp"+newnum+"\" href=\"javascript:void(0)\" style=\"display:none;float:right;\" onclick=\"javascript:removeNew3('tp"+newnum+"',this);\">delete</a>"+
			"<a href=\"javascript:void(0)\" id=\"adp"+newnum+"\" onclick='javascript:openNew3(\"tp"+newnum+"\",this);'>add another project</a>"+
			"</td></tr></table>";
			document.getElementById(table).parentNode.appendChild(tb);
			self.style.display="none";
			var rn="rmp"+newnum;
			document.getElementById(rn).style.display="block";
		}
		function openNew4(table,self){
			var tb=document.createElement("Table");
			var num=table.substring(2,tb.length);
			var newnum=parseInt(num)+1;
			tb.setAttribute("id","te"+newnum);
			tb.innerHTML="<table id=\"te"+newnum+"\" style=\"display:block\">"+
			"<tr><th >Company Name</th><td>"+
			"<input type=\"text\"  name=\"companyname"+newnum+"\" class=inputForm></td></tr>"+
			"<tr><th >Location</th><td><input type=\"text\"  name=\"elocation"+newnum+"\" class=inputForm>"+
			"</td></tr><tr><th >Start Date</th><td><input type=\"text\"  name=\"estartDate"+newnum+"\" class=inputForm>"+
			"</td></tr><tr><th >End Date</th><td><input type=\"text\"  name=\"eendDate"+newnum+"\" class=inputForm>"+
			"</td></tr><tr><th >Role</th><td><input type=\"text\"  name=\"role"+newnum+"\" class=inputForm>"+
			"</td></tr><tr><th >Description</th><td><textarea name=\"edesc"+newnum+"\" rows=\"4\" cols=\"50\"></textarea>"+ 
			"</td></tr><tr><th ></th><td>"+
			"<a id=\"rme"+newnum+"\" href=\"javascript:void(0)\" style=\"display:none;float:right;\" onclick=\"javascript:removeNew4('te"+newnum+"',this);\">delete</a>"+
			"<a href=\"javascript:void(0)\" id=\"ade"+newnum+"\" onclick='javascript:openNew4(\"te"+newnum+"\",this);'>add another experiences</a>"+
			"</td></tr></table>";
			document.getElementById(table).parentNode.appendChild(tb);
			self.style.display="none";
			var rn="rme"+newnum;
			document.getElementById(rn).style.display="block";
		}
	</script>
	<body>
	<jsp:include page="header.jsp" />
		<table id="mainTableInThisPage" width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="60">
			<tr valign="top">
			<td width="20%"><jsp:include page="left.jsp" /></td>
			<td width="80%" height="600" bgcolor=#FFFFFF  style="padding:2px;">
				<table width="100%" align="center" border="0" cellpadding="0" cellspacing="2">
						<tr>
							<td>
								<div class=daohang>You current position<img src="${pageContext.request.contextPath}/images/icon02.gif" style="margin-top:10px;"/><font>Add a CV</font> </div>
							</td>
						</tr>							
				</table>							
				<form name="formx" method="post" action="${pageContext.request.contextPath}/AddAndListCVServlet?type=add">
					<table class=addFile cellspacing=1 cellspacing="2" align=center>
					<caption>Add a CV</caption>
					<tr>
						<th >Resume name</th>
						<td>
							<input type="text"  name="name"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Content name</th>
						<td>
							<input type="text"  name="contentname"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Resume Type</th>
						<td>
							<select name="wtype">
							  <option value="general">general</option>
							  <option value="web">web</option>
							  <option value="database">datebase</option>
							  <option value="game">game</option>
							  <option value="system">system</option>
							  <option value="other">other</option>
							</select>
						</td>
					</tr>
					<tr>
						<th >Address</th>
						<td>
							<input type="text"  name="address"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Zipcode</th>
						<td>
							<input type="text"  name="zipcode"  class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Email</th>
						<td>
							<input type="text"  name="email" class=inputForm>
						</td>
					</tr>
					<tr>
						<th >Education</th>
						<td>
							<table id="tb1" style="display:block">
								<tr>
									<th >SchoolName</th>
									<td>
										<input type="text"  name="schoolname1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Location</th>
									<td>
										<input type="text"  name="location1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >SchoolType</th>
									<td>
										<select name="schooltype1">
										  <option value="university">University</option>
										  <option value="highschool">high school</option>
										  <option value="middleschool">middle school</option>
										  <option value="primaryschool">primary school</option>
										</select>
									</td>
								</tr>
								<tr>
									<th >Start Date</th>
									<td>
										<input type="text"  name="enrollmentDate1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >End Date</th>
									<td>
										<input type="text"  name="graduateDate1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >GPA</th>
									<td>
										<input type="text"  name="averageGrade1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Award</th>
									<td>
										<textarea name="award1" rows="4" cols="50">
										</textarea> 
									</td>
								</tr>
								<tr>
									<th ></th>
									<td>
										<a href="javascript:void(0)" id="ad1" onclick="javascript:openNew('tb1',this);">add another education</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th >Technique</th>
						<td>
							<table id="tt1" style="display:block">
								<tr>
									<th >TechType</th>
									<td>
										<select name="techtype1">
										  <option value="Database">Database</option>
										  <option value="Software">Software</option>
										  <option value="Operating Systems">Operation System</option>
										  <option value="Programming Language">Programming Language</option>
										  <option value="Application Servers">Application Servers</option>
										</select>
									</td>
								</tr>
								<tr>
									<th >TechName</th>
									<td>
										<select name="techname1">
										  <option value="Mysql">Mysql</option>
										  <option value="Oracle">Oracle</option>
										  <option value="DB2">DB2</option>
										  <option value="Bugzilla">Bugzilla</option>
										  <option value="Redmine">Redmine</option>
										  <option value="Jenkins">Jenkins</option>
										  <option value="Jria">Jria</option>
										  <option value="Unix">Unix</option>
										  <option value="Linux">Linux</option>
										  <option value="Mac">Mac</option>
										  <option value="Windows">Windows</option>
										  <option value="Java">Java</option>
										  <option value="C">C</option>
										  <option value="C++">C++</option>
										  <option value="Ruby">Ruby</option>
										  <option value="Python">Python</option>
										  <option value="Tomcat">Tomcat</option>
										  <option value="Jboss">Jboss</option>
										  <option value="Weblogic">Weblogic</option>
										  <option value="WebSphere">WebSphere</option>
										  <option value="Resin">Resin</option>
										</select>
									</td>
								</tr>
								<tr>
									<th >Proficiency</th>
									<td>
										<select name="prof1">
										  <option value="9">expert</option>
										  <option value="3">intermediate</option>
										  <option value="1">newbie</option>
										</select>
									</td>
								</tr>
								<tr>
									<th >Time of Use</th>
									<td>
										<input type="text"  name="timeofuse1" class=inputForm> (month)
									</td>
								</tr>
								<tr>
									<th ></th>
									<td>
										<a href="javascript:void(0)" id="adt1" onclick="javascript:openNew2('tt1',this);">add another technique</a>
									</td>
								</tr>
							</table>
						</td>
						</tr>
						<tr>
						<th>Project</th>
						<td>
							<table id="tp1" style="display:block">
								<tr>
									<th >Project Name</th>
									<td>
										<input type="text"  name="projectname1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Start Date</th>
									<td>
										<input type="text"  name="pstartDate1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >End Date</th>
									<td>
										<input type="text"  name="pendDate1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >People</th>
									<td>
										<input type="text"  name="people1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Description</th>
									<td>
										<textarea name="desc1" rows="4" cols="50">
										</textarea> 
									</td>
								</tr>
								<tr>
									<th ></th>
									<td>
										<a href="javascript:void(0)" id="adp1" onclick="javascript:openNew3('tp1',this);">add another project</a>
									</td>
								</tr>
							</table>
						</td>
						</tr>
						<tr>
						<th>Experience</th>
						<td>
							<table id="te1" style="display:block">
								<tr>
									<th >Company Name</th>
									<td>
										<input type="text"  name="companyname1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Location</th>
									<td>
										<input type="text"  name="elocation1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Start Date</th>
									<td>
										<input type="text"  name="estartDate1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >End Date</th>
									<td>
										<input type="text"  name="eendDate1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Role</th>
									<td>
										<input type="text"  name="role1" class=inputForm>
									</td>
								</tr>
								<tr>
									<th >Description</th>
									<td>
										<textarea name="edesc1" rows="4" cols="50">
										</textarea> 
									</td>
								</tr>
								<tr>
									<th ></th>
									<td>
										<a href="javascript:void(0)" id="ade1" onclick="javascript:openNew4('te1',this);">add another experiences</a>
									</td>
								</tr>
							</table>
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
		<jsp:include page="footer.jsp" />
	</body>
</html>
