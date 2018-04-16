<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<style type="text/css">
.photo {
	width: 300px;
	height: 250px;
	border: 1px solid black;
}

.photo img {
	width: 100%;
	height: 100%;
}

.form-control {
	width: 400px;
}
</style>
<body onload="changeActive('menu5')">
	<h2 class="sub-header">
		<span class="glyphicon glyphicon-user" aria-hidden="true"
			style="font-size:20px;"></span>&nbsp;&nbsp;User Account
	</h2>



	<table>
		<tr>
			<td width="400" valign="top">
				<div class="photo">
					<img src="${basePath}upload/${loginUser.username}.jpg?t=<%=new Date() %>"
						onerror="errorImg(this)">
				</div>
				<form method="post" action="uploadPhoto"
					enctype="multipart/form-data" id="photoForm">
					&nbsp;&nbsp;
					<input type="hidden" value="${loginUser.username}.jpg"
						name="username">
					<p class="help-block">
						<input type="file" id="dofile" name="file" /><input type="submit"
							id="btnupload" name="btnupload" value="上传" /> Click here to
						change your photo.<br>Ps. These are notes for users.
					</p>
				</form>
			</td>
			<td align="justify" width="500px">
				<form class="form-horizontal" action="updateUser" id="accountForm">
					<!-- <img src="./jsp/img/headshot.png" alt="..."> -->
					<input type="hidden" value="${loginUser.username}"
						name="user.username">
					<div class="form-group">
						<input class="form-control" id="disabledInput" type="text"
							value="${loginUser.username}" disabled>
					</div>
					<div class="form-group">
						<label for="col-sm-2 control-label">Real Name</label><input
							type="text" class="form-control" id="exampleInputRealName1"
							placeholder="Real Name" name="user.realName"
							value="${loginUser.realName}">
					</div>
					<div class="form-group">
						<label for="col-sm-2 control-label">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password" name="user.password"
							value="${loginUser.password}">
					</div>
					<div class="form-group">
						<label class="radio-inline"> <input type="radio"
							name="user.gender" id="inlineRadio1" value="1"
							<c:if test="${loginUser.gender==1}">checked="checked"</c:if>>
							Male
						</label> <label class="radio-inline"> <input type="radio"
							name="user.gender" id="inlineRadio2" value="0"
							<c:if test="${loginUser.gender==0}">checked="checked"</c:if>>
							Female
						</label> <label class="radio-inline"> <input type="radio"
							name="user.gender" id="inlineRadio3" value="option3" disabled>
							Unknown
						</label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							placeholder="Email" name="user.emailAddress"
							value="${loginUser.emailAddress}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Address</label> <input type="text"
							class="form-control" id="exampleInputAddress1"
							placeholder="Address" name="user.address"
							value="${loginUser.address}">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Tel</label> <input type="tel"
							class="form-control" id="exampleInputTel1" placeholder="Tel"
							name="user.tel" value="${loginUser.tel}">
					</div>
					<div class="form-group" valign="top">
						<button type="button" class="btn btn-default" onclick="saveUser()">Submit</button>
					</div>
				</form></td>
		</tr>
	</table>



	<script type="text/javascript">
		function saveUser() {
			alert("Save Success!");
			$('#accountForm').submit();

		}

		function savePhoto() {
			//alert("Save Success!");
			$('#photoForm').submit();

		}

		//图像加载出错时的处理
		function errorImg(img) {
			img.src = "./jsp/img/default.png";
			img.onerror = null;
		}
	</script>

</body>
</html>
