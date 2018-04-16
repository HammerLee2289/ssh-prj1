<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="images/favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="bootstrap/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="bootstrap/css/dashboard.css" rel="stylesheet">
<!-- dateTimePicker CSS -->
<link href="./bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<script src="bootstrap/js/ie-emulation-modes-warning.js"></script>
<style>
.pointer { /* 对没有href的<a>标签，鼠标悬停显示小手图案 */
	cursor: pointer;
}

.page-right { /* 分页选择靠右 */
	float: right
}

.wrap {
	width: 150px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>
</head>
<body>
	<nav>
		<jsp:include page="header.jsp"></jsp:include>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<tiles:insertAttribute name="body" />
				<!-- show userCard -->
				<!-- <button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#userCardModal">Launch
					demo modal</button> -->
				<jsp:include page="userCard.jsp"></jsp:include>
			</div>
		</div>

	</div>

	<!-- newExcuse Modal -->
	<jsp:include page="newExcuseModal.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.12.4.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="bootstrap/js/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
	<!-- dateTimePicker JS -->
	<script type="text/javascript"
		src="./bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript"
		src="./bootstrap/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>

	<script type="text/javascript">
		$('.form_date').datetimepicker({
			//language : 'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>
	<script type="text/javascript">
		/* window.HTMLAnchorElement.prototype.toString = function() { //手动修改toString方法，使得<a>标签中的this取的是<a>标签中的内容，而不是href的路径
			return this.innerHTML;
		} */

		function submitExcuse() {//提交表单
			var exId = $('#excuse-excuseId').val();
			if (exId.length != 0) {
				//alert("edit");
				document.getElementById('excuseForm').action = "editExcuse";
				$('#excuseForm').submit();
			} else {
				//alert("new");
				document.getElementById('excuseForm').action = "newExcuse";
				$('#excuseForm').submit();
			}

		}

		function editExcuse(excuseId, name, type, reason, dateTime, duration) {//编辑excuse，回显
			$('#excuse-status').val("1");
			$('#excuse-excuseId').val(excuseId);
			$('#excuse-name').val(name);
			$('#excuse-typein').val(type);
			$('#excuse-type').html(type);
			$('#excuse-reason').val(reason);
			$('#excuse-date').val(dateTime);
			$('#excuse-duration').val(duration);
			$('#exampleModal').modal();
		}

		function newExcuse() {//新建excuse，清空回显
			$('#excuse-status').val("1");
			$('#excuse-excuseId').val("");
			$('#excuse-name').val("");
			$('#excuse-reason').val("");
			$('#excuse-date').val("");
			$('#excuse-duration').val("");
			$('#exampleModal').modal();
		}

		function searchChooseType(choice) {//search excuse类型选择
			$('#searchExcuse-typein').val($(choice).html());
			$('#searchExcuse-type').html($(choice).html());
		}

		function exportDetail() {//导出detail
			window.location.href = "exportExcuseDetail.action";
		}

		function exportSta() {//导出统计表
			window.location.href = "exportExcuseSta.action";
		}

		function showExcuse() {//显示excuse
			window.location.href = "showExcuse.action?page=1";
		}

		function showSta() {//显示excuse统计结果
			window.location.href = "showExcuseSta.action?page=1";
		}

		/* function showUserCard(username) {//显示个人信息卡
			window.location.href = "findUserByName.action?username="+username;
			$('#myModal').modal();
		} */
		function showUserCard(username) {//ajax弹出款显示stuff个人信息
			var xhr = createXmlHttp();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						document.getElementById("userCard-info").innerHTML = xhr.responseText;
					}
				}
			}
			xhr.open("GET", "findUserByName.action?username=" + username, true);
			xhr.send(null);
			function createXmlHttp() {
				var xmlHttp;
				try {
					xmlHttp = new XMLHttpRequest();
				} catch (e) {
					try {
						xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
					} catch (e) {
						try {
							xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
						} catch (e) {
						}
					}
				}
				
				document.getElementById('userCard-photo').src = '${basePath}upload/'+username+'.jpg?t=<%=new Date() %>';
				$('#userCardModal').modal();

				return xmlHttp;
				//alert(username);

			}
		}
	</script>

	<script type="text/javascript">
		$(function() {
			$("[data-toggle='popover']").popover();
		});

		function changeActive(menuNum) {
			document.getElementById(menuNum).className = "active";
		}
	</script>
</body>
</html>
