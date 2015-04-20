<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Statistics</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/statistics.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<table id="mainTableInThisPage" width="100%" align="center" border="0"
		cellpadding="0" cellspacing="0" height="60">
		<tr valign="top">
			<td width="20%"><jsp:include page="left.jsp" /></td>
			<td width="80%" height=600 bgcolor=#FFFFFF style="padding: 2px;">
				<div class=daohang>
					You current position<img
						src="${pageContext.request.contextPath}/images/icon02.gif"
						style="margin-top: 10px;" /><font>Statistics</font>
				</div>
				<table id="statistics"
					style="min-width: 400px; height: 200px; margin: 0 auto;">
					<thead>
						<tr>
							<th class="no-underline"><a href="#"
								class="float-right no-underline"></a></th>
						</tr>
					</thead>
					<thead>
						<tr>
							<td><span class="green-font">New requests and Active
									users Trend by Day/Week/Month</span>
								<div class="line5"></div>
								<div id="tab">
									<ul class="nav nav-tabs">
										<li class="active"><a id="1" href="#day"
											data-toggle="tab">Daily</a></li>
										<li><a id="2" href="#week" data-toggle="tab">Weekly</a></li>
										<li><a id="3" href="#month" data-toggle="tab">Monthly</a></li>
									</ul>
									<div class="tab-pane fade container5" id="day">11111</div>
									<div class="tab-pane fade container5" id="week"
										style="display: none;"></div>
									<div class="tab-pane fade container5" id="month"
										style="display: none;"></div>
							</span> 
						</tr>
					</thead>
					<script type="text/javascript">
						jQuery(function($) {
							var url = "${pageContext.request.contextPath}/StatisticsServlet";
							$.ajax({
										type : "POST",
										url : url,
										data : "",
										dataType : 'json',
										success : function(rtnData) {
											$(".nav.nav-tabs")
													.children()
													.each(
															function() {
																$("#1")
																		.click(
																				function() {
																					$(
																							"#day")
																							.show();
																					$(
																							"#week")
																							.hide();
																					$(
																							"#month")
																							.hide();
																					displayTicketTrendChart("day");
																				});

																$("#2")
																		.click(
																				function() {
																					$(
																							"#day")
																							.hide();
																					$(
																							"#week")
																							.show();
																					$(
																							"#month")
																							.hide();
																					displayTicketTrendChart("week");
																				});

																$("#3")
																		.click(
																				function() {
																					$(
																							"#day")
																							.hide();
																					$(
																							"#week")
																							.hide();
																					$(
																							"#month")
																							.show();
																					displayTicketTrendChart("month");
																				});

															});

											var userGroupThisMonth = rtnData.userGroupThisMonth;
											var userGroupLastMonth = rtnData.userGroupLastMonth;
											displayTicketTrendChart("day");

											function displayTicketTrendChart(container) {
												if (container == "day") {
													var dateType = rtnData.day.dateType;
													var resultRequest = rtnData.day.resultRequest;
												} else if (container == "week") {
													var dateType = rtnData.week.dateType;
													var resultRequest = rtnData.week.resultRequest;
												} else if (container == "month") {
													var dateType = rtnData.month.dateType;
													var resultRequest = rtnData.month.resultRequest;
												}
												var chart = new Highcharts.Chart(
														{
															chart : {
																type : 'column',
																renderTo : container
															},
															title : {
																text : ''
															},
															subtitle : {},
															xAxis : {
																categories : dateType,
															},
															yAxis : {
																min : 0,
																title : {
																	text : 'hour(s)'
																},
																stackLabels: {
													                enabled: true,
													                style: {
													                    fontWeight: 'bold',
													                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
													                }
													            }
															},
															legend: {
													               align: 'right',
													               x: -10,
													               verticalAlign: 'top',
													               y: -10,
													               floating: true,
													               backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
													               borderColor: '#CCC',
													               borderWidth: 1,
													               shadow: false
													        },
															tooltip : {
																headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
																pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
																		+ '<td style="padding:0"><b>{point.y}</b></td></tr>',
																footerFormat : '</table>',
																shared : true,
																useHTML : true
															},
															plotOptions : {
																 column: {
													                    stacking: 'normal',
													                    dataLabels: {
													                        enabled: true,
													                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
													                    }
													             }
															},
															 series: resultRequest
														});
												return chart;
											}}
									});
						});
					</script>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>