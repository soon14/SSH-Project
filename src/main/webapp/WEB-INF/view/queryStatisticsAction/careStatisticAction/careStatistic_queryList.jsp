<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<cqu:border>
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1></h1>
		</div>
		<div class="tab_next style2">
			<table>
				<tr>
					<td><s:a action="careStatistic_list"><span>今日统计</span></s:a></td>
				    <td><s:a action="careStatistic_weekList"><span>本周统计</span></s:a></td>
				    <td><s:a action="careStatistic_monthList"><span>本月统计</span></s:a></td>
				    <td class="on"><s:a action="careStatistic_query" class="coverOff"><span>查询</span></s:a></td>
				</tr>
			</table>
		</div>
		<div class="editBlock search">
			<s:form id="pageForm" action="careStatistic_query">
			<table>
				<tr style="height:20px;">
					<td colspan="3"></td>
					<!--  
					<td>
						<input id="todayStatistic" class="inputButton" type="button" value="今日统计"/>
					</td>
					<td>
						<input id="weekStatistic" class="inputButton" type="button" value="本周统计"/>
					</td>
					<td>
						<input id="monthStatistic" class="inputButton" type="button" value="本月统计"/>
					</td>
					<td>
						<input id="query" class="inputButton" type="button" value="查询"/>
					</td>
					-->
				</tr>
				<tr>
					<th>保养时间:</th>
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
						<s:textfield class="userSelector inputChoose inputText" id="driverName" type="text" name="driver.name"/>
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
              				<th>保养时间</th>
                			<th>保养里程间隔(KM)</th>
                			<th>保养金额(元)</th>
						</tr>
					</thead>
					<tbody class="tableHover">
				        <s:iterator value="recordList">
						<tr>
							<td>${car.plateNumber}</td>
							<td style="text-align:right"><s:date name="date" format="yyyy-MM-dd"/></td>
							<td style="text-align:right">${mileInterval}</td>
							<td style="text-align:right"><fmt:formatNumber value="${money}" pattern="#0"/></td>
						</tr>
						</s:iterator> 
					</tbody>
				</table>
			</div>
			<%@ include file="/WEB-INF/view/public/pageView.jspf" %>
		</div>
	</div>
</cqu:border>
