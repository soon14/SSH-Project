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
			<h1>新建对账单信息</h1>
			<p>&nbsp;&nbsp;</p>
		</div>
		<div>
		    <input type="button" class="inputButton" id="excludeOrder" value="排除订单" />
		    <input type="button" class="inputButton" id="invoice" value="开票" />
		    <input type="button" class="inputButton" id="cancelOrderStatement" value="取消对账单" />
		</div>
		<br/>
		<div>
		</div>
		<div id="totalMoneyDiv" style="display:none;text-align:right;">
		      <span style="color:red;font-size:18px;">总金额: </span>
		      <span id="totalPrice" style="color:red;font-size:18px;"></span>
		      <span style="color:red;font-size:18px;"> 元</span>
		</div>
		<div class="dataGrid">
			<div class="tableWrap">
				<table id="dataTable">
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
						<col></col>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="allChecked"/>全选</th>
							<th>单位</th>
							<th>乘车人</th>
							<th>计费方式</th>
							<th>车型</th>
							<th>起止时间</th>
							<th>起止地点</th>
							<th>里程(KM)</th>
							<th>天数(天)</th>
							<th>金额(元)</th>
						</tr>
					</thead>
					<tbody class="tableHover">
					 <s:iterator value="orderList">
						<tr>
						    <td><input type="checkbox" id="${id}" class="checkboxItems"/></td>
							<td>${customerOrganization.name}</td>
							<td>${customer.name}</td>
                			<td>${status.label}</td>
							<td>${carServiceType.title}</td>
							<td><s:date name="actualBeginDate" format="yyyy-MM-dd HH:mm"/>&nbsp;&nbsp;-&nbsp;&nbsp;<s:date name="actualEndDate" format="yyyy-MM-dd HH:mm"/></td>
							<td>${fromAddress}-${fromAddress}</td>
							<td>${actualMile}</td>
                			<td>${actualDay}</td>
							<td><fmt:formatNumber value="${actualMoney}" pattern="#.0"/></td>
						</tr>
						</s:iterator> 
					</tbody>
				</table>
			</div>
	   </div>
	</div>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>	
	<script type="text/javascript" src="js/artDialog4.1.7/artDialog.source.js?skin=blue"></script>
    <script type="text/javascript" src="js/artDialog4.1.7/jquery.artDialog.source.js"></script>
    <script src="js/artDialog4.1.7/plugins/iframeTools.source.js"></script>	
	<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/common.js"></script>	
	<script type="text/javascript">
	
	//选中的订单的总价格
    var totalPrice=0;
    $(document).ready(function(){
      //为所有订单项计算总价格
	   $(".checkboxItems").each(function(){
		    //获取当前复选框选中的order的金额 
		    var moneyTd=$(this).parent().parent().find("td:last");
		    //获取订单金额
		    totalPrice+=parseFloat(moneyTd.text());
	   });
	   $("#totalPrice").html(totalPrice);
	   $("#totalMoneyDiv").show();
    });
	
	     $("#excludeOrder").bind("click",function(){
	        var orderStatementName=$("#orderStatementNameId").val();
	 	    //用于记录选中的复选框的对应的order的id
	    	var orderIds=new Array();
	    	var index=0;
	    	//获取表格数据中的所有复选框对象
	    	var checkboxes=$("#dataTable").find("tr").find("td").find("input");
	    	checkboxes.each(function() {      // 每一个复选框
	           if($(this).is(":checked")){
	    		  //获取被选中复选框的对应的order的id
	 	          orderIds[index++]=$(this).prop("id"); 
	    	   }
	    	});
	    	if(index==0){
	    	   alert("未选择任何订单");
	    	   return false;
	    	}   
	    	if($("#allChecked").is(":checked")){
	    		if(confirm("选中了对账单中的所有订单，排除所有订单会导致该对账单被取消，确定排除？")){
	    			excludeOrder(orderIds,orderStatementName);
	    		}
	    	}else{
	    		if(confirm("确定排除该订单？")){
	    		   excludeOrder(orderIds,orderStatementName);
	    		}
	    	}
    	 });
	     
	     //排除订单
	     function excludeOrder(orderIds,orderStatementName){
    	    	//将选中的订单记录的id序列发动到服务器端，用于后台生成相应的对账单
    	        var idStr="";
    	 	    for(var i=0;i<orderIds.length;i++){
    	 	    	idStr+=orderIds[i]+",";
    	 	    }
    	 	    //去掉最后一个多余的","
    	 	    idStr=idStr.substring(0,idStr.length-1);
    	 	    $.get("orderStatement_cancelOrders.action?orderIds="+idStr+"&orderStatementName="+encodeURI(orderStatementName)+"&timestamp="+new Date().getTime(),function(json){
    	 	          if(json.status==1){
    	 	             window.location = "orderStatement_info.action?orderStatementName="+orderStatementName;
    	 	          }
    	 	    });
	     }
	     
	     $("#cancelOrderStatement").bind("click",function(){
	    	 if(confirm("确定取消对账单？")){
	    		var orderStatementName=$("#orderStatementNameId").val();
			    	$.get("orderStatement_cancelOrderStatement.action?orderStatementName="+encodeURI(orderStatementName)+"&timestamp="+new Date().getTime(),function(json){
			              if(json.status==1){
			            	 window.location = "orderStatement_list.action";
			              }
			        });
	    	 }
	      });  
	     
	     $("#invoice").click(function(){
	            self.location.href='orderStatement_invoice.action?orderStatementId=${id}';
	        });
	</script>
</body>
</html>