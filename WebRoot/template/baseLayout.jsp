<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>FAQ - Bootstrap Admin</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="./css/bootstrap.min.css" rel="stylesheet" />
<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />


<link href="./css/font-awesome.css" rel="stylesheet" />

<link href="./css/adminia.css" rel="stylesheet" />
<link href="./css/adminia-responsive.css" rel="stylesheet" />


<link href="./css/pages/faq.css" rel="stylesheet" />

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

	<tiles:insertAttribute name="header" />
	<div id="content">

		<div class="container">

			<div class="row">

				<tiles:insertAttribute name="menu" />
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>

	<tiles:insertAttribute name="footer" />

	<script src="./js/jquery-1.7.2.min.js"></script>


	<script src="./js/bootstrap.js"></script>
	<script src="./js/faq.js"></script>

	<script>
		$(function() {

			$('.faq-list').goFaq();

		});
	</script>

</body>
</html>
