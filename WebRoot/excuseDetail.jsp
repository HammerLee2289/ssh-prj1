<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<body onload="changeActive('menu2')">
	<h2 class="sub-header">
		<span class="glyphicon glyphicon-list-alt" aria-hidden="true"
			style="font-size:20px;"></span>&nbsp;&nbsp;Excuse Table
	</h2>

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
						<span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
					</button>
					<button id="exportButton" type="button" class="btn btn-default"
						onclick="exportDetail()">
						<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
						export Excel
					</button>

					<span class="page-right"> You can click <span
						class="glyphicon glyphicon-plus" aria-hidden="true"></span> to new
						an excuse.
					</span>
				</div>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th style="text-align:center">#</th>
						<th style="text-align:center">Name</th>
						<th style="text-align:center">Type</th>
						<th style="text-align:center">Reason</th>
						<th style="text-align:center">DateTime</th>
						<th style="text-align:center">Duration</th>
						<th style="text-align:center"><a href="#"
							onclick="newExcuse()"><span class="glyphicon glyphicon-plus"
								aria-hidden="true"></span></a></th>
						<th style="text-align:center"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="excuse" varStatus="vs">
						<tr>
							<!-- <td><s:property value="#vs.index+1"/></td> -->
							<td align="center"><b>${vs.index+1}</b></td>
							<td align="center">
							<a onclick="showUserCard('${excuse.name}')" href="#">${excuse.name}</a></td>
							<%-- <a href="findUserByName.action?username=${excuse.name}">${excuse.name}</a></td> --%>
							<td align="center">${excuse.type}</td>
							<td align="center"><div class="wrap">
									<a tabindex="0" role="button" data-toggle="popover"
										data-trigger="focus" title="${excuse.name}:"
										data-content="${excuse.reason}"><span
										class="glyphicon glyphicon-search" aria-hidden="true"></span></a>&nbsp;&nbsp;${excuse.reason}
								</div></td>
							<td align="center">${excuse.dateTime}</td>
							<td align="center"><b>${excuse.duration}</b>天</td>
							<td align="center"><a class="pointer"
								onclick="editExcuse('${excuse.excuseId}','${excuse.name}','${excuse.type}','${excuse.reason}','${excuse.dateTime}','${excuse.duration}')"><span
									class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>
							<td align="center"><a
								href="deleteExcuse.action?excuseId=${excuse.excuseId}"><span
									class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
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
							<a href="showExcuse.action?page=1">第一页</a>
							<a
								href="showExcuse.action?page=<s:property value="%{currentPage-1}"/>">上一页</a>
						</s:else> <s:if test="%{currentPage != totalPage}">
							<a
								href="showExcuse.action?page=<s:property value="%{currentPage+1}"/>">下一页</a>
							<a href="showExcuse.action?page=<s:property value="totalPage"/>">最后一页</a>
						</s:if> <s:else>    
         			下一页  最后一页    
         		</s:else>
					</td>
				</tr>
			</s:iterator>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>

