<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="skins/main.css" rel="stylesheet" type="text/css" />
<style>
    	
    </style>
</head>
<body class="minW">
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1>车辆登记</h1>
			<p style="color: red">
				<s:if test="hasFieldErrors()">
					<s:iterator value="fieldErrors">
						<s:iterator value="value">
							<s:property />
						</s:iterator>
					</s:iterator>
				</s:if>
			</p>
		</div>
		<div class="editBlock detail p30">
			<s:form action="car_%{id == null ? 'borrowed' : 'edit'}" id="pageForm">
	        <s:hidden name="id"></s:hidden>
			<table> 
				<colgroup>
					<col width="80"></col>
					<col></col>
					<col></col>
					<col></col>
					<col></col>
					<col width="120"></col>
				</colgroup>
				<tbody>
					<tr>
						<th><s:property value="tr.getText('car.Car.plateNumber')" /><span class="required">*</span></th>
						<td>
								<s:textfield cssClass="inputText" name="plateNumber"/>
						</td>
					</tr>
					<tr>
						<th><s:property value="tr.getText('car.CarServiceType.title')" /><span class="required">*</span></th>
						<td>
								<s:select name="carServiceTypeId" cssClass="SelectStyle"
                        		list="carServiceTypeList" listKey="id" listValue="title"
                        		headerKey="" headerValue="选择服务类型"
                        		/>
						
						</td>
					</tr>
					<tr>
						<th><s:property value="tr.getText('car.ServicePoint.name')" /><span class="required">*</span></th>
						<td>
								<s:select name="servicePointId" cssClass="SelectStyle"
                        		list="servicePointList" listKey="id" listValue="name"
                        		headerKey="" headerValue="选择驻车点"
                        		/>
						</td>
					</tr>
					<tr>
	                <td colspan="2">	    
	                		<input name="actionFlag" type="hidden" value="${actionFlag }">            		 
		                	<input type="submit" id="btn" class="inputButton" value="确定"/>
		                	<a class="p15" href="javascript:history.go(-1);">返回</a>
		                
	                </td>
	            </tr>
				</tbody>
			</table>
			</s:form>
		</div>
		
	</div>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>	
	<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/common.js"></script>	
	<script src="js/artDialog4.1.7/artDialog.source.js?skin=blue"></script>
	<script src="js/artDialog4.1.7/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src="js/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="js/validate/messages_cn.js"></script>
	<script type="text/javascript">

	 $(function(){    	
			$("#pageForm").validate({
				submitout: function(element) { $(element).valid(); },
				rules:{
					// 配置具体的验证规则
					plateNumber:{
						required:true,
					},
					carServiceTypeId:{
						required:true,
					},
					servicePointId:{
						required:true,
					},
				}
			});
		});
	</script>
</body>
</html>