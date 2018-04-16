<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LoginPage</title>
<!-- <link rel="stylesheet" type="text/css" href="css/login/styles.css"> -->
</head>
<body>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>Welcome</h1>
			
			<form class="form" action="login">
				<input type="text" placeholder="Username" name="user.username">
				<input type="password" placeholder="Password" name="user.password">
				<button type="submit" id="login-button">Login</button>
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>

<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script>
$('#login-button').click(function (event) {
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
	setTimeout(function(){//延时1.5s执行submit()，原因是等待welcome下滑效果完成
		$('form').submit();
	},1500);
});
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
<h1>DataSystem</h1>
</div>
</body>
</html>