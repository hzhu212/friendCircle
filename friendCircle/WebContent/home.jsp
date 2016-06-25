<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FriendCircle HomePage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 700px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>
    <link href="./bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
  </head>

  <body background=".\bootstrap\img\background\0.jpg">
    <div class="container-narrow">

      <div class="masthead">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">关于我们</a></li>
          <!-- <li><a href="#">Contact</a></li> -->
        </ul>
        <h3 class="muted">FriendCircle</h3>
      </div>

      <hr>

      <div class="jumbotron">
        <h1>FriendCircle!</h1>
        <p class="lead">FriendCircle, share wonderful moments with your friends</p>
        <a class="btn btn-large btn-success" href="login.jsp">登录</a>
        <a class="btn btn-large btn-success" href="signup.jsp">注册</a>
      </div>

      <hr>

      <div class="footer">
        <p>&copy;Copyright ©&copy; 2016 FriendCircle  friendcircle.com All Rights Reserved.  By 马赞彭、仇立松、朱贺</p>
      </div>

    </div> <!-- /container -->
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./bootstrap/js/jquery.js"></script>

  </body>
</html>
