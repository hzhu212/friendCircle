<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="friendCircle.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
	<div class="container container-narrow" style="margin-top:100px;">
	    <div class="row">
	    	<div class="span6 offset3">

<%
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");
	StatusAPI statusAPI = new StatusAPI();
	String[] info = new String[4];
	info[0] = session.getAttribute("loginUserID").toString();
	Date date = new Date();
	info[1] = new SimpleDateFormat("yyyy-MM-dd").format(date);
	info[2] = new SimpleDateFormat("HH:mm:ss").format(date);
	info[3] = content;
	
/* 	for(String s: info){
		System.out.println(s);
	} */
	
	boolean success = statusAPI.addStatus(info);
	if(success){
		response.sendRedirect("user-status.jsp");
	}else{
		out.println(
		"<div class=\"alert alert-error alert-block\">"+
		"<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+
		"<h4>出错啦~</h4>"+
		"发布消息失败，请重试"+
		"</div>"
		);
	}
%>

				</div>
			</div>
		</div>
	</body>
</html>