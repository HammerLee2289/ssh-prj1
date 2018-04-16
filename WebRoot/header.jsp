<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Welcome, dear ${loginUser.realName}!</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><span class="glyphicon glyphicon-menu-hamburger"
						aria-hidden="true" style = "font-size:20px;"></span></a>
					<ul class="dropdown-menu">
						<li><a href="userAccountLink.action"><span class="glyphicon glyphicon-user"
								aria-hidden="true"></span>&nbsp;&nbsp;Account</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="lo_gin.jsp"><span class="glyphicon glyphicon-log-out"
								aria-hidden="true"></span>&nbsp;&nbsp;Logout</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="findStuffExcuse.action">newMsg&nbsp;<span
						class="badge">${fn:length(stuffExcuseList)}</span></a></li>
			</ul>

		</div>
	</div>
</nav>