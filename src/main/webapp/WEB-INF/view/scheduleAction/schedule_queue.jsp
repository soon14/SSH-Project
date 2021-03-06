﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<cqu:border>
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1>待调度队列列表</h1>
		</div>
		<div class="editBlock search">
		<form>
			<table>
				<tr>
					<th><h2>有&nbsp;<font style="font-style: normal;font-size: 25px;color: #58cf90;">${queueSize}</font>&nbsp;条订单待调度</h2></th>
					<td>&nbsp;&nbsp;</td>
					<td>
						<s:if test="canDistributeOrderToUser">
							<s:a action="schedule_dispatchOrder">
								<input type="button" class="inputButton" value="调  度"/>
							</s:a>
						</s:if>
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<s:a action="schedule_watchKeeper">
							<input type="button" class="inputButton" value="设置值班模式"/>
						</s:a>
					</td>
				</tr>
			</table>
		</form>
		</div>
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
					</colgroup>
					<thead>
						<tr>
							<th >订单号</th>
							<th>客户姓名</th>
							<th>单位</th>
							<th>计费方式</th>
							<th>开始时间</th>
							<th>车型</th>
							<th>上车点</th>
							<th>下车点</th>
							<th class="alignCenter">操作</th>
						</tr>
					</thead>
					<tbody class="tableHover">
					<s:iterator value="recordList">
						<tr>
							<td>${sn}</td>
							<td>${customer.name}</td>
							<td>${customerOrganization.name}</td>
							<td>${chargeMode.label }</td>
							<td>${planBeginDateString }</td>
							<td>${serviceType.title}</td>
							<td>${fromAddress}</td>
							<td>${toAddress}</td>
							<td class="alignCenter">
								<s:if test="canDistributeOrderToUser">
									<s:a action="schedule_scheduleFromQueue?scheduleFromQueueOrderId=%{id}"><i class="icon-operate-schedule" title="调度"></i></s:a>
								</s:if>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<s:form id="pageForm" action="schedule_queue">
			<%@ include file="/WEB-INF/view/public/pageView.jspf" %>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
		function refresh(){
			window.location.reload();
		}
		$(document).ready(function () {
			setInterval(refresh,10000); 
		}); 
	</script>
</cqu:border>