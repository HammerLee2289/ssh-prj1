<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<body onload="changeActive('menu3')">
	<h2 class="sub-header">
		<span class="glyphicon glyphicon-comment" aria-hidden="true"
			style="font-size:20px;"></span>&nbsp;&nbsp;Stuff Application
	</h2>
	<div class="table-responsive">
		<div class="panel panel-default">
			<div class="panel-heading">
				<b>Note: </b>An E-mail will be send to stuff after you choose <span
					class="glyphicon glyphicon-ok" aria-hidden="true"></span> or <span
					class="glyphicon glyphicon-remove" aria-hidden="true"></span>
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
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stuffExcuseList}" var="excuse" varStatus="vs">
						<tr>
							<!-- <td><s:property value="#vs.index+1"/></td> -->
							<td align="center"><b>${vs.index+1}</b></td>
							<td align="center"><a
								onclick="showUserCard('${excuse.name}')" href="#">${excuse.name}</a></td>
							<td align="center">${excuse.type}</td>
							<td align="center"><div class="wrap">
									<a tabindex="0" role="button" data-toggle="popover"
										data-trigger="focus" title="${excuse.name}:"
										data-content="${excuse.reason}"><span
										class="glyphicon glyphicon-search" aria-hidden="true"></span></a>&nbsp;&nbsp;${excuse.reason}
								</div></td>
							<td align="center">${excuse.dateTime}</td>
							<td align="center"><b>${excuse.duration}</b>天</td>
							<td align="center"><a
								href="agreeStuffExcuse.action?excuseId=${excuse.excuseId}&stuffName=${excuse.name}"><span
									class="glyphicon glyphicon-ok" aria-hidden="true"></span></a></td>
							<%-- <td align="center"><a
								href="deleteStuffExcuse.action?excuseId=${excuse.excuseId}&stuffName=${excuse.name}"><span
									class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td> --%>
							<td align="center"><a href="#"
								onclick="deleteStuffExcuse('${excuse.excuseId}', '${excuse.name}')"><span
									class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
							<!-- 自定义标签 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="emailMsg.jsp"></jsp:include>
	<script type="text/javascript">
		function deleteStuffExcuse(excuseId, name) {
			$('#emailMsg-excuseId').val(excuseId);
			$('#emailMsg-name').val(name);
			$('#emailMsg').modal();

		}

		function sendAndDelete() {
			window.location.href = "deleteStuffExcuse.action?excuseId="
					+ $('#emailMsg-excuseId').val() + "&stuffName="
					+ $('#emailMsg-name').val() + "&emailMsg="
					+ $('#emailMsg-reason').val();
		}
	</script>

</body>
</html>
