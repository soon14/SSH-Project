<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp" %>
<cqu:border>
	<div class="space">
		<!-- 标题 -->
		<div class="title">
			<h1>商业保险类型管理</h1>
		</div>
		<div class="editBlock search">
			<table>
				<tr>
					<td>
						<s:a cssClass="buttonA" action="commercialInsuranceType_addUI">商业保险类型登记</s:a>
					</td>
					<td>
						<a class="p15" href="javascript:history.go(-1);">返回</a>
					</td>										
				</tr>
			</table>
		</div>
		<div class="dataGrid">
			<div class="tableWrap">
				<table>
					<thead>
						<tr>
							<th>商业保险</th>
							<th class="alignCenter">操作</th>
						</tr>
					</thead>
					<tbody class="tableHover">
						<s:iterator value="commercialInsuranceTypeList">
						<tr>
							<td>${name }</td>						
							<td class="alignCenter">								
								<s:a action="commercialInsuranceType_editUI?id=%{id}" ><i class="icon-operate-edit" title="修改"></i></s:a>	
							<s:if test="canDeleteCommercialInsuranceType">
								<s:a action="commercialInsuranceType_delete?id=%{id}" onclick="result=confirm('确认要删除吗？'); if(!result) coverHidden(); return result;"><i class="icon-operate-delete" title="删除"></i></s:a>
							</s:if>
							<s:else>
							</s:else>
							</td>
						</tr>
						</s:iterator> 
					</tbody>
				</table>
			</div>
		</div>
	</div>
</cqu:border>