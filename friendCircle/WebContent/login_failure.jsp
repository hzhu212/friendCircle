<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login FriendCircle</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-login {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	margin-top: 50px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-login .form-login-heading, .form-login .checkbox {
	margin-bottom: 10px;
}

.form-login input[type="text"], .form-login input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.form-login a {
	float: right;
}
</style>
<link href="./bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
</head>

<body background=".\bootstrap\img\background\0.jpg">

	<div class="container">

		<form class="form-login" action="dologin.jsp" method="post">
			<h2 class="form-login-heading">登录</h2>
			<input type="text" class="input-block-level" name="username"
				placeholder="请输入用户名"> <input type="password"
				class="input-block-level" name="password" placeholder="请输入密码">
			<label class="checkbox"> <input type="checkbox"
				value="remember-username"> 记住用户名
			</label> <label class="checkbox"> <input type="checkbox"
				value="remember-password"> 记住密码
			</label>
			<font color="#FF0000">用户名或密码错误！</font> 
			<br>
			<br>
			<button class="btn btn-large btn-primary" type="submit">登录</button>
			<a href="home.jsp" class="btn-large pull-right">返回首页</a>
			<a href="signup.jsp" class="btn-large pull-right">注册</a>
		</form>

	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./bootstrap/js/jquery-3.0.0.min.js"></script>
</body>
</html>