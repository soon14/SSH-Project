﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>skins/main.css">
</head>
<body class="minW">
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1>订单管理</h1>
		</div>
		<div class="tab_next style2">
			<table>
				<tr>
					<td><s:a action="order_orderManager"><span>订单列表</span></s:a></td>					
				    <td class="on"><a href="#"><span>还未接受的订单</span></a></td>
				    <td><s:a action="order_protocolOrderRemind"><span>协议订单到期提醒</span></s:a></td>
				</tr>
			</table>
		</div>
		<br/>
		<div class="dataGrid">
			<div class="tableWrap">
				<table>
					<colgroup>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
						<col width="120"></col>
					</colgroup>
					<thead>
						<tr>
							<th>订单号</th>
							<th>单位</th>
							<th>姓名</th>
							<th>计费方式</th>
							<th>计划起止时间</th>
							<th>司机</th>
							<th>电话号码</th>
							<th>状态</th>
							<th>等待时间（分）</th>
							<th class="alignCenter">操作</th>
						</tr>
					</thead>
					<tbody class="tableHover">
					<s:iterator value="recordList">
						<tr>
							<td class="alignCenter">${sn }</td>
							<td>${customerOrganization.name }</td>
							<td>${customer.name }</td>
							<td>${chargeModeString }</td>
							<td>${planDateString}</td>
							<td>${driver.name }</td>
							<td>${phone }</td>							
							<td>${statusString }</td>
							<td>${waiteMinutes }</td>
							<td class="alignCenter">
							<s:a action="order_view.action?orderId=%{id}"><i class="icon-operate-detail" title="查看"></i></s:a>
							<s:a action="order_print.action?sn=%{sn}"><i class="icon-operate-print" title="打印"></i></s:a>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		function refresh(){
			window.location.reload();
		}
		$(document).ready(function () {
			setInterval(refresh,30000); 
		}); 
	</script>
</body>
</html>