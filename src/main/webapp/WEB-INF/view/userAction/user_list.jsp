<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="skins/main.css">
</head>
<body class="minW">
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1>用户管理</h1>
			<p>用户信息的维护</p>
		</div>
		<div class="editBlock search">
			<s:form id="pageForm" action="user_list">
			<table>
				<tr>
					<th><s:property value="tr.getText('privilege.User.name')" /></th>
					<td><s:textfield cssClass="inputText" name="name" type="text" /></td>
					<td>
						<input class="inputButton" type="submit" value="查询" />
						<input id="add" class="inputButton" type="button" value="添加用户" name="button" />
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
							<th><s:property value="tr.getText('privilege.User.loginName')" /></th>
              				<th><s:property value="tr.getText('privilege.User.name')" /></th>
                			<th><s:property value="tr.getText('privilege.Department.name')" /></th>
                			<th><s:property value="tr.getText('privilege.User.roles')" /></th>
                			<th><s:property value="tr.getText('privilege.User.phoneNumber')" /></th>
                			<th><s:property value="tr.getText('privilege.User.email')" /></th>
			                <th><s:property value="tr.getText('privilege.User.description')" /></th>
			                <th>相关操作</th>
						</tr>
					</thead>
					<tbody class="tableHover">
				        <s:iterator value="recordList">
						<tr>
							<td>${loginName}</td>
							<td>${name}</td>
							<td>${department.name}</td>
							<td>
								<s:iterator value="roles">
                					${name}
                				</s:iterator>
                			</td>
                			<td>${phoneNumber}</td>
							<td>${email}</td>
							<td>${description}&nbsp;</td>
							<td>
			                	<s:a action="user_delete?id=%{id}" onclick="return confirm('确认要删除吗？');">删除</s:a>
			                    <s:a action="user_editUI?id=%{id}">修改</s:a>
			                </td>
						</tr>
						</s:iterator> 
					</tbody>
				</table>
			</div>
			<%@ include file="/WEB-INF/view/public/pageView.jspf" %>
		</div>
	</div>
	
	<s:debug></s:debug>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>	
	<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/common.js"></script>	
	<script type="text/javascript">
		$(function(){
	        $("#add").click(function(){
	            self.location.href='user_addUI.action';
	        });
	    })
	</script>
</body>
</html>
