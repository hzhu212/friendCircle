<%@page language="java" import="friendCircle.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="util.Util"%>
<%@page import="friendCircle.*"%>

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
	#content-area{
		background-color:rgba(255, 255, 255, 0.3);
		padding: 50px;
	}
</style>

</head>

<body>

	<%
	String hostUserName=session.getAttribute("loginUser").toString();
	String hostUserID = session.getAttribute("loginUserID").toString();
	UserAPI userApi = new UserAPI();
	FriendAPI friendApi=new FriendAPI();
	ArrayList<String> userFriends=friendApi.getFriend(hostUserID);
	%>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="home.jsp">FriendCircle</a>
				<div class="nav-collapse collapse">

					<ul class="nav">
						<li><a href="user-home.jsp">我的首页</a></li>
						<li><a href="user-status.jsp">我的状态</a></li>
						<li class="active"><a href="user-friends.jsp">我的好友</a></li>
						<li><a href="user-info.jsp">个人信息</a></li>
						<li><a href="user-group.jsp">用户群组</a></li>
					</ul>
					<form class="navbar-search pull-left">
						<input type="text" class="search-query" placeholder="搜索好友">
					</form>

					<ul class="nav pull-right">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= hostUserName %>
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu role=" aria-labelledby="dLabel">
								<li><a href="doLogOff.jsp">退出</a></li>
							</ul>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>

	<div class="container container-narrow" style="margin-top:100px;">
		<div class="row">
			<div class="span7 offset2" id="content-area">
				<%
				//如果没有好友
				if(userFriends.isEmpty()){
					out.print("<div id=\"friends\">"+"<p class=\"lead\">您尚未添加好友</p class=\"lead\">"+"</div>");
				}
				else{
					out.print("<div id=\"friends\">"+"<p class=\"lead\">您的好友信息为：</p class=\"lead\">"+"</div>");
				}
				//有好友
				for(String friendName: userFriends){
					String[] aFriend=userApi.getUser(userApi.getUserNameByID(friendName));
					out.print(
					"<div id=\"friends\">" +
						"<img class=\"media-object\" data-src=\"holder.js/64x64\" alt=\"无法加载\" src=\"./bootstrap/img/display-photo/"+aFriend[0]+".png\" style=\"width: 64px; height: 64px;\"> "+
						"<br>好友名："+aFriend[1]+"<br>" +
						"个性签名："+aFriend[4]+"<br>" +
					"</div>");
				}
				//好友推荐
				ArrayList<ArrayList<String>> suggestion=friendApi.getSuggestion(hostUserID);
				out.print("<div id=\"suggest\">"+"<h2>好友推荐信息：</h2>"+"</div>");
				for(ArrayList<String> sug:suggestion){
					if(sug==null)
						continue;
					out.print("<div id=\"suggest\">"
							+"<br>推荐好友："+sug.get(2)+"<br>"
							+"关系路径："+"你——"+sug.get(1)+"——"+sug.get(2)+"<br></div>");
				}
				%>
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