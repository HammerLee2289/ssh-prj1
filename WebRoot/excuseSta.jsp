<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<body onload="changeActive('menu2')">
	<h2 class="sub-header"><span class="glyphicon glyphicon-stats" aria-hidden="true" style = "font-size:20px;"></span>&nbsp;&nbsp;Excuse Table</h2>

	<div>
		<div>
			<jsp:include page="filter.jsp"></jsp:include>
		</div>
	</div>
	<div class="table-responsive">

		<div class="panel panel-default">
			<div class="panel-heading">

				<div class="changeMod">
					<button type="button" class="btn btn-default"
						aria-label="Left Align" onclick="showExcuse()" title="Detail Mode">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default"
						aria-label="Left Align" onclick="showSta()" title="Sta Mode">
						<span class="glyphicon glyphicon-stats" aria-hidden="true" ></span>
					</button>
					<button id="exportButton" type="button" class="btn btn-default"
						onclick="exportSta()">
						<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
						export Excel
					</button>
					
					<span class="page-right">
						You can click  <span class="glyphicon glyphicon-search"
								aria-hidden="true"></span>  to search for more details.</span>
				</div>
				</div>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align:center">#</th>
								<th style="text-align:center">Name</th>
								<th style="text-align:center">Type1</th>
								<th style="text-align:center">Type2</th>
								<th style="text-align:center">Type3</th>
								<th style="text-align:center">Total</th>
								<th style="text-align:center">Overtime</th>
								<th style="text-align:center"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="excuseSta" varStatus="vs">
								<tr>
									<td align="center"><b>${vs.index+1}</b></td>
									<td align="center"><a onclick="showUserCard('${excuseSta.name}')" href="#">${excuseSta.name}</a></td>
									<td align="center">${excuseSta.type1Duration}</td>
									<td align="center">${excuseSta.type2Duration}</td>
									<td align="center">${excuseSta.type3Duration}</td>
									<td align="center">共<b>${excuseSta.durationSta}</b>天</td>
									<td align="center">${excuseSta.overtimeDuration}天</td>
									<td align="center"><a href="showExcuse.action?excuse.name=${excuseSta.name}&excuse.type=${excuse.type}&excuse.dateTime=${excuse.dateTime}&excuse.dateTimeEnd=${excuse.dateTimeEnd}"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></td>
									
									<!-- 自定义标签 -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="page-right">
					<s:iterator value="pageBean">
						<tr>
							<td colspan="6" align="center" bgcolor="#5BA8DE">共<s:property
									value="allRow" />条记录，共<s:property value="totalPage" />页，当前第<s:property
									value="currentPage" />页。<s:if test="%{currentPage == 1}">第一页  上一页  </s:if>
								<!-- currentPage为当前页 --> <s:else>
									<a href="showExcuseSta.action?page=1">第一页</a>
									<a
										href="showExcuseSta.action?page=<s:property value="%{currentPage-1}"/>">上一页</a>
								</s:else> <s:if test="%{currentPage != totalPage}">
									<a
										href="showExcuseSta.action?page=<s:property value="%{currentPage+1}"/>">下一页</a>
									<a
										href="showExcuseSta.action?page=<s:property value="totalPage"/>">最后一页</a>
								</s:if> <s:else>    
         			下一页  最后一页    
         		</s:else>
							</td>
						</tr>
					</s:iterator>
				</div>
			
		</div>
	</div>
</body>

