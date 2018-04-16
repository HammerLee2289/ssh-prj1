<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html lang="zh-CN">

<div>
	<!-- <iframe src="filter.jsp" width="100%" height="300px" frameborder="0"></iframe> -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left" action="showExcuse"
					method="post">
					<table>
						<tr>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="name"
										name="excuse.name" value="${excuse.name}" id="searchExcuse-name">
								</div>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="btn-group">
									<input type="hidden" name="excuse.type" value=""
										id="searchExcuse-typein">
									<button type="button" class="btn btn-default"
										id="searchExcuse-type">--请选择--</button>
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<span class="caret"></span> <span class="sr-only">Toggle
											Dropdown</span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#" onclick="searchChooseType(this)">type1</a></li>
										<li><a href="#" onclick="searchChooseType(this)">type2</a></li>
										<li><a href="#" onclick="searchChooseType(this)">type3</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#" onclick="searchChooseType(this)">overtime</a></li>
									</ul>
								</div>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>From</b>&nbsp;
							</td>

							<td>

								<div class="input-group date form_date col-md-5" data-date=""
									data-date-format="yyyy-mm-dd">
									<input class="form-control" type="text"
										value="${excuse.dateTime}" readonly name="excuse.dateTime" id="searchExcuse-dateTime">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div> <b>to</b>

								<div class="input-group date form_date col-md-5" data-date=""
									data-date-format="yyyy-mm-dd">
									<input class="form-control" type="text"
										value="${excuse.dateTimeEnd}" readonly
										name="excuse.dateTimeEnd" id="searchExcuse-dateTimeEnd"> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<a href="#" onclick="cleanFilter()">重置</a>
							</td>
						
							<td>
							<button type="submit" class="btn btn-default">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
								</button></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>
<script type="text/javascript">
	function cleanFilter() {
		$('#searchExcuse-name').val("");
		$('#searchExcuse-dateTime').val("");
		$('#searchExcuse-dateTimeEnd').val("");
		$('#searchExcuse-typein').val("");
		$('#searchExcuse-type').html("--请选择--");
	}
</script>
</html>