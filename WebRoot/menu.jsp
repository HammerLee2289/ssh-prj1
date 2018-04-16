<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
	<!-- <li><img src="./jsp/img/headshot.png" alt="..." class="img-rounded"></li> -->
		<li id="menu1"><a href="testPage.jsp"><span
				class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;Home</a></li>
		<li id="menu2"> <a href="showExcuse.action" onclick="changeActive()"><span
				class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;Excuse
				Table</a></li>
		<li id="menu3"><a href="findStuffExcuse.action"><span
				class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;Messages <span class="badge pull-right">${fn:length(stuffExcuseList)}</span></a></li>
		<li id="menu4"><a href="faqLink.action"><span
				class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>&nbsp;&nbsp;FAQ</a></li>
		<li id="menu5"><a href="userAccountLink.action"><span
				class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;User Account</a></li>
		<li id="menu6"><a href="lo_gin.jsp"><span
				class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;&nbsp;Logout</a></li>
	</ul>
</div>
<script type="text/javascript">

</script>