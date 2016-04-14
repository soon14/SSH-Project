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
	<title></title>
	<link rel="stylesheet" type="text/css" href="skins/main.css">
</head>
<body class="minW">
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1>车辆保养</h1>
		</div>
		<div class="editBlock search">
			<s:form id="pageForm" action="carCare_list">
			<table>
				<tr>
					<td>
						<input id="register" class="inputButton" type="button" value="保养登记"/>
						<input id="appoint" class="inputButton" type="button" value="保养预约"/>
					</td>
					<th><s:property value="tr.getText('car.Car.plateNumber')" /></th>
					<td>
						<s:textfield id="car_platenumber" cssClass="inputText inputChoose" onfocus="this.blur();" name="car.plateNumber" type="text" />
					</td>
					<th>从</th>
					<td>
						<s:textfield name="date1" class="Wdate half" type="text" onfocus="new WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<th>到</th>
					<td>
						<s:textfield name="date2" class="Wdate half" type="text" onfocus="new WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>
						<input class="inputButton" type="submit" value="查询"/>
						<input id="remind" class="inputButton" type="button" value="保养提醒"/>
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
							<th><s:property value="tr.getText('car.Car.plateNumber')" /></th>
              				<th><s:property value="tr.getText('car.CarCare.date')" /></th>
                			<th><s:property value="tr.getText('car.CarCare.mileInterval')" /></th>
                			<th><s:property value="tr.getText('car.CarCare.money')" /></th>
                			<th><s:property value="tr.getText('car.CarCare.memo')" /></th>
                			<th><s:property value="tr.getText('car.CarCare.appointment')" /></th>
                			<th>操作</th>
						</tr>
					</thead>
					<tbody class="tableHover">
				        <s:iterator value="recordList">
				        
						<tr>
							<td><s:a action="carCare_detail?id=%{id}">${car.plateNumber}</s:a></td>
							<td style="text-align:right"><s:date name="date" format="yyyy-MM-dd"/></td>
							<td style="text-align:right">${mileInterval}</td>
							<td style="text-align:right"><fmt:formatNumber value="${money}" pattern="#0"/></td>
							<td>${memo}</td>
							<td>
								<s:if test="appointment==true">
								<s:text name="是"></s:text>
								</s:if>
								<s:else>
								<s:text name="否"></s:text>
								</s:else>
							</td>
							<td>
								<s:if test="appointment">
                    			<s:a action="carCare_delete?id=%{id}" onclick="return confirm('确认要删除吗？');"><i class="icon-operate-delete" title="删除"></i></s:a>
                    			<s:a action="carCare_editUI?id=%{id}"><i class="icon-operate-edit" title="修改"></i></s:a>
                    			</s:if>
								<s:else>
								</s:else>                    			
                			</td>
						</tr>
						</s:iterator> 
					</tbody>
				</table>
			</div>
			<s:form id="pageForm" action="carCare_care">
			<%@ include file="/WEB-INF/view/public/pageView.jspf" %>
			</s:form>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>	
	<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/common.js"></script>	
	<script src="js/artDialog4.1.7/artDialog.source.js?skin=blue"></script>
	<script src="js/artDialog4.1.7/plugins/iframeTools.source.js"></script>
	<script type="text/javascript">
		$(function(){
	        $("#register").click(function(){
	            self.location.href='carCare_addUI.action';
	        });
	        $("#appoint").click(function(){
				self.location.href='carCare_appoint.action';
			});
	        $("#remind").click(function(){
	            self.location.href='carCare_remind.action';
	        });
	        
	       
	    })
	</script>
</body>
</html>
