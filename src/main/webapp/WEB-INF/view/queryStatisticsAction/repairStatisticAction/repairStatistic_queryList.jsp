<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>维修</title>
	<link rel="stylesheet" type="text/css" href="skins/main.css">
</head>
<body class="minW">
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1></h1>
		</div>
		<div class="tab_next style2">
			<table>
				<tr>
					<td><s:a action="repairStatistic_list"><span>今日统计</span></s:a></td>
				    <td><s:a action="repairStatistic_weekList"><span>本周统计</span></s:a></td>
				    <td><s:a action="repairStatistic_monthList"><span>本月统计</span></s:a></td>
				    <td class="on"><s:a action="repairStatistic_query"><span>查询</span></s:a></td>
				</tr>
			</table>
		</div>
		<div class="editBlock search">
			<s:form id="pageForm" action="repairStatistic_query">
			<table>
				<tr style="height:20px;">
					<td colspan="3"></td>
				</tr>
				<tr>
					<th>维修时间:</th>
					<td>
						<input class="Wdate half" name="date1" type="text" onfocus="new WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						-
						<input class="Wdate half" name="date2" type="text" onfocus="new WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<th>车牌号:</th>
					<td>
						<s:textfield id="car_platenumber" cssClass="carSelector inputText inputChoose" onfocus="this.blur();" name="plateNumber" type="text" />
					</td>
					<th>司机姓名:</th>
					<td>
						<s:textfield class="userSelector inputChoose inputText" id="driverName" type="text" name="car.driver.name"/>
						<s:textfield id="driverId" name="driverId" type="hidden"/>
					</td>
					<td>
						<input class="inputButton" type="submit" value="查询"/>
					</td>
				</tr>
			</table>
			</s:form>
		</div>
		<div class="dataGrid">
			<div class="tableWrap">
				<table>
					<thead>
						<tr>
							<th>车牌号</th>
              				<th>维修时间</th>
              				<th>维修地点</th>
                			<th>维修内容</th>
                			<th>维修金额(元)</th>
                			<th>付款日期</th>
						</tr>
					</thead>
					<tbody class="tableHover">
				        <s:iterator value="recordList">
						<tr>
							<td>${car.plateNumber}</td>
							<td style="text-align:right"><s:date name="fromDate" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:date name="toDate" format="yyyy-MM-dd"/></td>
							<td>${repairLocation}</td>
							<td>${memo}</td>
							<td style="text-align:right"><fmt:formatNumber value="${money}" pattern="#0"/></td>
							<td style="text-align:right"><s:date name="payDate" format="yyyy-MM-dd"/></td>
						</tr>
						</s:iterator> 
					</tbody>
				</table>
			</div>
			<%@ include file="/WEB-INF/view/public/pageView.jspf" %>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>	
	<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/common.js"></script>	
	<script src="js/artDialog4.1.7/artDialog.source.js?skin=blue"></script>
	<script src="js/artDialog4.1.7/plugins/iframeTools.source.js"></script>
</body>
</html>
