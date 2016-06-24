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
            <li><a href="user-homepage.jsp">我的首页</a></li>
            <li class="active"><a href="user-status.jsp">我的状态</a></li>
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
          String userID = "1";
          String[][] allStatus = StatusAPI.getStatusByUserID(userID);
          for(int i=0; i<allStatus.length; i++){
            String statusID = allStatus[i][0];
            String userIDTemp = allStatus[i][1];
            String content = allStatus[i][2];
            String time = allStatus[i][3];
            String userName = UserAPI.getUserNameByID(userIDTemp);
            if(statusID==null) break;

            out.println(
            "<div class=\"media\"> "+
            "<a class=\"pull-left\" href=\"#\"> "+
            "  <img class=\"media-object\" data-src=\"holder.js/64x64\" alt=\"头像\" src=\"./bootstrap/img/display-photo/"+userIDTemp+".png\" style=\"width: 64px; height: 64px;\"> "+
            "  </a> "+
            "  <div class=\"media-body\"> "+
            "  <a class=\"media-heading lead\" href=\"#\">"+userName+"</a> "+
            "    <p>"+content+"</p> "+
            "    <p class=\"muted\"><em>"+time+"</em></p> ");

            String[][] allComments = CommentAPI.getCommentsByStatusID(statusID);
            boolean isEmpty = (allComments[0][1]==null);
            if(!isEmpty){
            	out.println("<div class=\"well well-small\"> ");
            }
            for(int j=0; j<allComments.length; j++){
              String from = allComments[j][1];
              String to = allComments[j][2];
              String comContent = allComments[j][3];
              if(from==null) break;
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
