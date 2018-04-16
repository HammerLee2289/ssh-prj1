<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Dashboard - Bootstrap Admin</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    
    <link href="./css/font-awesome.css" rel="stylesheet" />
    
    <link href="./css/adminia.css" rel="stylesheet" /> 
    <link href="./css/adminia-responsive.css" rel="stylesheet" /> 
    
    <link href="./css/pages/dashboard.css" rel="stylesheet" /> 
    

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	
<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			
			<a class="brand" href="./">Adminia Admin</a>
			
			<div class="nav-collapse">
			
				<ul class="nav pull-right">
					<li>
						<a href="#"><span class="badge badge-warning">7</span></a>
					</li>
					
					<li class="divider-vertical"></li>
					
					<li class="dropdown">
						
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							Rod Howard <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							<li>
								<a href="./account.jsp"><i class="icon-user"></i> Account Setting  </a>
							</li>
							
							<li>
								<a href="./change_password.jsp"><i class="icon-lock"></i> Change Password</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="./"><i class="icon-off"></i> Logout</a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div> <!-- /nav-collapse -->
			
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->


<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>

<div id="content">
	
	<div class="container">
		
		<div class="row">
			
			<div class="span3">
				
				<div class="account-container">
				
					<div class="account-avatar">
						<img src="./img/headshot.png" alt="" class="thumbnail" />
					</div> <!-- /account-avatar -->
				
					<div class="account-details">
					
						<span class="account-name">Rod Howard</span>
						
						<span class="account-role">Administrator</span>
						
						<span class="account-actions">
							<a href="javascript:;">Profile</a> |
							
							<a href="javascript:;">Edit Settings</a>
						</span>
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					
					<li class="active">
						<a href="./">
							<i class="icon-home"></i>
							Dashboard 		
						</a>
					</li>
					
					<li>
						<a href="./faq.jsp">
							<i class="icon-pushpin"></i>
							FAQ	
						</a>
					</li>
					
					<li>
						<a href="./plans.jsp">
							<i class="icon-th-list"></i>
							Pricing Plans		
						</a>
					</li>
					
					<li>
						<a href="./grid.jsp">
							<i class="icon-th-large"></i>
							Grid Layout	
							<span class="label label-warning pull-right">5</span>
						</a>
					</li>
					
					<li>
						<a href="./charts.jsp">
							<i class="icon-signal"></i>
							Charts	
						</a>
					</li>
					
					<li>
						<a href="./account.jsp">
							<i class="icon-user"></i>
							User Account							
						</a>
					</li>
					
					<li>
						<a href="./login.jsp">
							<i class="icon-lock"></i>
							Login	
						</a>
					</li>
					
				</ul>	
				
				<hr />
				
				<div class="sidebar-extra">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
				</div> <!-- .sidebar-extra -->
				
				<br />
		
			</div> <!-- /span3 -->
			
			
			
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-home"></i>
					Dashboard					
				</h1>
				
				<div class="stat-container">
										
					<div class="stat-holder">						
						<div class="stat">							
							<span>564</span>							
							Completed Sales							
						</div> <!-- /stat -->						
					</div> <!-- /stat-holder -->
					
					<div class="stat-holder">						
						<div class="stat">							
							<span>423</span>							
							Pending Sales							
						</div> <!-- /stat -->						
					</div> <!-- /stat-holder -->
					
					<div class="stat-holder">						
						<div class="stat">							
							<span>96</span>							
							Returned Sales							
						</div> <!-- /stat -->						
					</div> <!-- /stat-holder -->
					
					<div class="stat-holder">						
						<div class="stat">							
							<span>2</span>							
							Chargebacks							
						</div> <!-- /stat -->						
					</div> <!-- /stat-holder -->
					
				</div> <!-- /stat-container -->
				
				<div class="widget">
										
					<div class="widget-header">
						<i class="icon-signal"></i>
						<h3>Area Chart</h3>
					</div> <!-- /widget-header -->
														
					<div class="widget-content">					
						<div id="bar-chart" class="chart-holder"></div> <!-- /bar-chart -->				
					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->
				
				
				
				<div class="widget widget-table">
										
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>Table</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Username</th>
									<th>Company</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>1</td>
									<td>Michael</td>
									<td>Jordan</td>
									<td>@mjordan</td>
									<td>Chicago Bulls</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>					
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Magic</td>
									<td>Johnson</td>
									<td>@mjohnson</td>
									<td>Los Angeles Lakers</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>						
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Charles</td>
									<td>Barkley</td>
									<td>@cbarkley</td>
									<td>Phoenix Suns</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>						
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>Karl</td>
									<td>Malone</td>
									<td>@kmalone</td>
									<td>Utah Jazz</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>					
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td>David</td>
									<td>Robinson</td>
									<td>@drobinson</td>
									<td>San Antonio Spurs</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>						
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>Reggie</td>
									<td>Miller</td>
									<td>@rmiller</td>
									<td>Indiana Pacers</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>						
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td>Clyde</td>
									<td>Drexler</td>
									<td>@cdrexler</td>
									<td>Portland Trail Blazers</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>						
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
								<tr>
									<td>8</td>
									<td>Hakeem</td>
									<td>Olajuwon</td>
									<td>@holajuwon</td>
									<td>Houston Rockets</td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="icon-ok"></i>								
										</a>						
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>						
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					
					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->
				
				
				
				
				<div class="row">
					
					<div class="span5">
									
						<div class="widget">
							
							<div class="widget-header">
								<h3>5 Column</h3>
							</div> <!-- /widget-header -->
																
							<div class="widget-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span5 -->
		
					<div class="span4">
						
						<div class="widget">
							
							<div class="widget-header">
								<h3>4 Column</h3>
							</div> <!-- /widget-header -->
																
							<div class="widget-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
					</div> <!-- /span4 -->
					
				</div> <!-- /row -->
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 2012 Go Ideate.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/excanvas.min.js"></script>
<script src="./js/jquery.flot.js"></script>
<script src="./js/jquery.flot.pie.js"></script>
<script src="./js/jquery.flot.orderBars.js"></script>
<script src="./js/jquery.flot.resize.js"></script>


<script src="./js/bootstrap.js"></script>
<script src="./js/charts/bar.js"></script>

  </body>
</html>
