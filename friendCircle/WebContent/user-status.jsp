<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="util.Util" %>
<%@page import="friendCircle.*" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>FriendCircle-My status</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Le styles -->
	<link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="./bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<style type="text/css">
		body{
			background-color: ivory;
      margin-bottom: 300px;
		}
		form.form-actions{
			background-color: rgba(240, 128, 128, 0.1);
			border-radius: 5px;
			border: none;
		}

	</style>

	<script type="text/javascript">
    var statusID = "";
    var targetUserName = "";
    var inputDom = "";

    // 清空状态编辑框
    function clearContent(){
      document.getElementById("writeStatus").value="";
    }

    // 当点击一个用户名，则将他设置为要回复的用户
    function userNameClicked(thisUserName,thisStatusID){
      statusID = thisStatusID;
      targetUserName = thisUserName;
      if(inputDom !== ""){
        inputDom.placeholder = "发表评论";
      }
      inputDom = document.getElementById(thisStatusID);
      inputDom.placeholder = "回复"+thisUserName;
    }

    // 提交回复，如果没有要回复的用户名或者当前定位的状态与点选的用户名不是同一条，则回复发状态者；
    function sendComment(defaultStatusID,defaultUserName){
      if(statusID === "" || statusID!==defaultStatusID){
        statusID = defaultStatusID;
        targetUserName = defaultUserName;
        if(inputDom !== ""){
          inputDom.placeholder = "发表评论";
        }
        inputDom = document.getElementById(statusID);
      }
      commentContent = inputDom.value;
      // alert(statusID+"\n"+targetUserName+"\n"+commentContent);
      sendAjax();
      statusID = "";
      targetUserName = "";
      inputDom = "";
    }

    // 通过ajax向服务端传输参数
    function sendAjax(){
      $.post("doReleaseComment.jsp",
      {
        "statusID":statusID,
        "targetUserName":targetUserName,
        content:commentContent
      },
      function(data,status){
        // alert("Data: " + data + "\nStatus: " + status);
        // alert(typeof status);
        if (status === "success") {
          location.reload();
        }else{
          alert("发送评论失败！");
        }
      });
    };
  </script>

</head>

<body>

	<%
	StatusAPI statusAPI = new StatusAPI();
	UserAPI userAPI = new UserAPI();
	CommentAPI commentAPI = new CommentAPI();

	String hostUserName = session.getAttribute("loginUser").toString();
	String hostUserID = session.getAttribute("loginUserID").toString();
	%>

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
						<li class="active"><a href="user-status.jsp">我的状态</a></li>
						<li><a href="user-friends.jsp">我的好友</a></li>
						<li><a href="user-info.jsp">个人信息</a></li>
						<li ><a href="user-group.jsp">群组</a></li>
					</ul>

					<form class="navbar-search pull-left">
						<input type="text" class="search-query" placeholder="搜索好友">
					</form>
					
					<ul class="nav pull-right">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= hostUserName %>
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu role="menu" aria-labelledby="dLabel"">
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
			<div class="span7 offset2">

  			<div class="media">
  				<a class="pull-left" href="#">
  					<%="<img class=\"media-object\" data-src=\"holder.js/64x64\" alt=\"头像\" src=\"./bootstrap/img/display-photo/"+hostUserID+".png\" style=\"width: 64px; height: 64px;\">"%>
  				</a>
  				<div class="media-body">
  					<a class="media-heading lead" href="#"><%= hostUserName %></a>
  					<p class="lead text-warning">发布动态</p>
  					<form class="form-actions" action="doReleaseStatus.jsp" method="post">
  						<textarea id="writeStatus" class="input-block-level" rows="5" name="content" placeholder="在这里写下你想说的话吧..."></textarea>
  						<button type="submit" class="btn btn-primary">发布</button>
  						<button type="button" class="btn" onclick="clearContent();">清空内容</button>
  					</form>
  				</div>
  			</div>
  			
  			<%
				ArrayList<HashMap<String,String>> statusList = statusAPI.getStatusByUserID(hostUserID);
				if(statusList.isEmpty()){
					out.println("<p class=\"lead\">没有动态</p>");
				}
				for(HashMap<String,String> aStatus: statusList){
					String statusID = aStatus.get("statusID");
					String userID = aStatus.get("userID");
					String userName = userAPI.getUserNameByID(userID);
					String content = aStatus.get("content");
					String time = aStatus.get("date") + " " + aStatus.get("time");

					out.println(
          "<div class=\"media\"> "+
          "<a class=\"pull-left\" onclick=\"userNameClicked('"+userName+"','"+statusID+"')\"> "+
          "<img class=\"media-object\" data-src=\"holder.js/64x64\" alt=\"头像\" src=\"./bootstrap/img/display-photo/"+hostUserID+".png\" style=\"width: 64px; height: 64px;\"> "+
          "</a> "+
          "<div class=\"media-body\"> "+
          "<a class=\"media-heading lead\" onclick=\"userNameClicked('"+userName+"','"+statusID+"')\">"+hostUserName+"</a> "+
          "<p>"+content+"</p> "+
          "<p class=\"muted\"><em>"+time+"</em></p> ");

					ArrayList<HashMap<String,String>> commentList = commentAPI.getCommentsByStatusID(statusID);
					boolean isEmpty = (commentList.isEmpty());
					
					if(!isEmpty){
						out.println("<div class=\"well well-small\"> ");
					}
					for(HashMap<String,String> aComment: commentList){
						String from = aComment.get("fromUserName");
						String to = aComment.get("toUserName");
						String comContent = aComment.get("content");
						
						out.println(
            "<div> "+
            "<a onclick=\"userNameClicked('"+from+"','"+statusID+"')\">"+from+"</a><span> 回复 </span><a onclick=\"userNameClicked('"+to+"','"+statusID+"')\">"+to+"</a><span>: </span> "+
            "<span>"+comContent+"</span> "+
            "</div> ");
					}
					
					if(!isEmpty){
						out.println("</div>");
					}
					
					out.println(
          "<div class=\"input-append pull-right\"> "+
          "<input id=\""+statusID+"\" class=\"span5\" id=\"appendedInputButton\" type=\"text\" placeholder=\"发表评论\"> "+
          "<button class=\"btn\" type=\"button\" onclick=\"sendComment('"+statusID+"','"+userName+"')\">确认</button> "+
          "</div> "
          );

					out.println(
					"</div> "+
					"</div>"
					);
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
