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
<body>
	<a onclick="signIn()" href="#">sign in</a><br>
	<a onclick="newExcuse()" href="#">new excuse</a><br>
	<a  href="#">new excuse</a><br>
	<!-- newExcuse Modal -->
	<jsp:include page="newExcuseModal.jsp"></jsp:include>
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
	function signIn(){
		alert("sign in success!");
	} 
	
	function newExcuse(){
		$('#exampleModal').modal();
	}
	
	function submitExcuse(){
		$('#excuse-status').val("0");
		document.getElementById('excuseForm').action = "newExcuse";
		$('#excuseForm').submit();
	}
	
	function sendEmail(){
		window.location.href="sendEmail.action";
	}

	</script>
</body>

</html>
