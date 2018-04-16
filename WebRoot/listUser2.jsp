<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>

<body>

	    <span style="font-size:12px"><body>  
         <form action="upload.action" method="post" enctype="multipart/form-data" >   
             请选择需要上传的文件：<input type="file" id="dofile" name="file"/><br />  
             <input type="submit" id="btnupload" name="btnupload" value="开始上传">  
         </form>  
      </body></span>  
</body>
</html>
