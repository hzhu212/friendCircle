<%@page language="java" import="friendCircle.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="util.Util"%>
<%@page import="friendCircle.StatusAPI"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FriendCircle-UserInfo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="./bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<style type="text/css">
	body{
		background-image: url("./bootstrap/img/background/3.jpg");
		background-size: cover;
	}
	#context{
		background-color:rgba(255, 255, 255, 0.3);
		padding: 50px;
	}
	#changeInfo{
		padding: 50px;
	}
</style>
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">

        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>

        <a class="brand" href="home.jsp">FriendCircle</a>
        <div class="nav-collapse collapse">

          <ul class="nav">
            <li><a href="user-home.jsp">我的首页</a></li>
            <li><a href="user-status.jsp">我的状态</a></li>
            <li><a href="user-friends.jsp">我的好友</a></li>
            <li class="active"><a href="user-info.jsp">个人信息</a></li>
          </ul>

          <form class="navbar-search pull-left">
            <input type="text" class="search-query" placeholder="搜索好友">
          </form>
          
          <ul class="nav pull-right">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">用户名
                <b class="caret"></b>
              </a>
              <ul class="dropdown-menu role="menu" aria-labelledby="dLabel"">
                <li><a href="#">退出</a></li>
              </ul>
            </li>
          </ul>

        </div>
      </div>
    </div>
  </div>

	<div class="container container-narrow" style="margin-top:100px;">
  	<div class="row">
  		<div class="span8 offset2" id="context">

				<%
					String userName=session.getAttribute("loginUser").toString();
					UserAPI doInfo=new UserAPI();
					String[] userInfo=doInfo.getUser(userName);
					out.print(
						"<div class=\"media\"> "+
							"<a class=\"pull-left\" href=\"#\"> "+
								"<img class=\"media-object\" data-src=\"holder.js/64x64\" alt=\"无法加载\" src=\""+userInfo[5]+"\""+"style=\"width: 64px; height: 64px;\"> "+
							"</a>" + 
							"<div class=\"media-body\">" + 
								"<a class=\"media-heading lead\" href=\"#\">"+userInfo[1]+"</a><br>"+
								"<p>email: "+userInfo[3]+"</p><br> "+
								"<p>个性签名："+userInfo[4]+"</p><br> "+
								"<p>性别："+userInfo[6]+"</p><br> "+
								"<p>生日："+userInfo[7]+"</p><br> "+
								"<p>城市："+userInfo[8]+"</p><br> "+
							"</div>"+
						"</div>");
				%>
				<!-- <br> -->
				<button class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal">修改信息</button>

				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">个人信息修改</h4>
							</div>
							<form id="changeInfo" class="form-signin" action="doinfo.jsp" method="post">
								<input type="email" class="input-block-level" name="email" placeholder="电子邮箱"> 
								<p>性别：<input type="radio" name="sex" value="0">Male（男）<input type="radio" name="sex" value="1">Female（女）<br></p>
								<input type="text" class="input-block-level" name="signature" placeholder="个性签名"><br>
								头像图片:<input type='file' name='picture' size='40'>
								<input type="date" class="input-block-level" name="birthday" placeholder="生日"><br>
								<input type="text" class="input-block-level" name="city" placeholder="城市"><br>
								<!-- 按钮 -->
								<button class="btn btn-middle btn-primary" type="submit">提交更改</button>
								<button type="button" class="btn btn-middle btn-default" data-dismiss="modal">关闭</button>
							</form>
						</div>
					</div>
	      </div>
	      
	    </div>
	  </div>
	</div>

	<!-- Le javascript
  ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./bootstrap/js/jquery-3.0.0.min.js"></script>
	<script src="./bootstrap/js/bootstrap.js"></script>

</body>
</html>