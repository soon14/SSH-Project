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
			<h1>价格表信息</h1>
		</div>
		<div class="editBlock search">
			<table style="">
				<tr>
					<td>
						<s:a cssClass="buttonA" action="priceTable_addUI?priceTableId=%{priceTableId}&actionFlag=add">新增价格</s:a>
					</td>					
				</tr>
			</table>
		</div>
		<div class="dataGrid">
			<div class="tableWrap">
				<table>
					<thead>
						<tr>
							<th class="alignCenter">车类</th>
							<th class="alignCenter">车型</th>
							<th class="alignCenter">8小时<br/>（100公里内）</th>
							<th class="alignCenter">4小时<br/>（50公里内）</th>
							<th class="alignCenter">超公里<br/>（每公里）</th>
							<th class="alignCenter">超时<br/>（每小时）</th>
							<th class="alignCenter">机场接送机<br/>（50公里/2小时）</th>
							<th class="alignCenter">操作</th>
						</tr>
					</thead>
					<tbody class="tableHover">
								<s:iterator value="#session.mapList" id="column"> 
								<s:set name="total" value="#column.value.size"/> 
								<s:iterator value="#column.value" status="s" id="list1">
								<tr> 
									<s:if test="#s.first">
									<td class="td" rowspan="${total}">
										<s:property value="#column.key"/>
									</td>
									</s:if> 
									<td>  
								 		<s:property value="#list1[1]"/>
								 	</td>
									<td>
										<s:property value="#list1[2]"/>
									</td> 
									<td><s:property value="#list1[3]"/></td> 
									<td><s:property value="#list1[4]"/></td> 
									<td><s:property value="#list1[5]"/></td> 
									<td><s:property value="#list1[6]"/></td> 
									<td class="alignCenter">
										<a href="priceTable_editUI.action?priceTableId=<s:property value="priceTableId"/>&actionFlag=edit&superTitle=<s:property value="#column.key"/>&serviceTypeTitle=<s:property value="#list1[1]"/>" ><i class="icon-operate-edit" title="编辑"></i></a>
										<a href="priceTable_delete.action?priceTableId=<s:property value="priceTableId"/>&serviceTypeTitle=<s:property value="#list1[1]"/>" onclick="return confirm('确定删除吗？')"><i class="icon-operate-delete" title="删除"></i></a>
									</td>
								</tr> 
								</s:iterator> 
						 		</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>	
	<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
	<script src="js/artDialog4.1.7/artDialog.source.js?skin=blue"></script>
	<script src="js/artDialog4.1.7/plugins/iframeTools.source.js"></script>	
	<script type="text/javascript" src="js/common.js"></script>	
	<script type="text/javascript">
	</script>
</body>
</html>
