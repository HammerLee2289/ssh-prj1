<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Register Page</title>
</head>
<body>

	<s:form action="register">
		<s:textfield name="user.username" label="用户名" onblur="checkUserName()"
			id="username"></s:textfield><span id="span1"></span>  
		<s:password name="user.password" label="密码"></s:password>
		<s:select list="#{'1':'男','0':'女'}" listKey="key" listValue="value"
			name="user.gender" label="性别" value="1"></s:select>
		<s:submit value="注册"></s:submit>
	</s:form>

	<script type="text/javascript">
	//ajax验证用户名是否重复
		function checkUserName() {
			var username = document.getElementById("username").value;
			var xhr = createXmlHttp();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						document.getElementById("span1").innerHTML = xhr.responseText;
					}
				}
			}
			xhr.open("GET", "checkUsername.action?username=" + username, true);
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

				return xmlHttp;
				//alert(username);

			}
		}
	</script>

</body>
</html>
