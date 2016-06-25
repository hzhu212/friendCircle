<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="util.Util" %>
<%@page import="friendCircle.*" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>FriendCircle-My homepage</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Le styles -->
  <link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="./bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
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
            <li class="active"><a href="user-home.jsp">我的首页</a></li>
            <li><a href="user-status.jsp">我的状态</a></li>
            <li><a href="user-friends.jsp">我的好友</a></li>
            <li><a href="user-info.jsp">个人信息</a></li>
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
      <div class="span7 offset2">
      
      <%
      	  StatusAPI statusAPI = new StatusAPI();
      	  UserAPI userAPI = new UserAPI();
      	  CommentAPI commentAPI = new CommentAPI();
      	  
      	  String hostUserID = "1";
          String hostUserName = userAPI.getUserNameByID(hostUserID);
      	  
          ArrayList<HashMap<String,String>> statusList = statusAPI.getFriendsStatus(hostUserID);
          for(HashMap<String,String> aStatus: statusList){
            String statusID = aStatus.get("statusID");
            String userID = aStatus.get("userID");
            String userName = userAPI.getUserNameByID(userID);
            String content = aStatus.get("content");
            String time = aStatus.get("date") + " " + aStatus.get("time");

            out.println(
            "<div class=\"media\"> "+
            "<a class=\"pull-left\" href=\"#\"> "+
            "  <img class=\"media-object\" data-src=\"holder.js/64x64\" alt=\"头像\" src=\"./bootstrap/img/display-photo/"+userID+".png\" style=\"width: 64px; height: 64px;\"> "+
            "  </a> "+
            "  <div class=\"media-body\"> "+
            "  <a class=\"media-heading lead\" href=\"#\">"+userName+"</a> "+
            "    <p>"+content+"</p> "+
            "    <p class=\"muted\"><em>"+time+"</em></p> ");

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
              "      <div> "+
              "      <a href=\"#\">"+from+"</a><span> 回复 </span><a href=\"#\">"+to+"</a><span>: </span> "+
              "        <span>"+comContent+"</span> "+
              "    </div> ");
            }
            
            if(!isEmpty){
              out.println("</div>");
            }
            
            out.println(
            "  <div class=\"input-append pull-right\"> "+
            "    <input class=\"span5\" id=\"appendedInputButton\" type=\"text\" placeholder=\"发表评论\"> "+
            "    <button class=\"btn\" type=\"button\">确认</button> "+
            "  </div> "
            );

            out.println(
            "  </div> "+
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
