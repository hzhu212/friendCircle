<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="friendCircle.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("utf-8");//防止中文乱码

	UserAPI userAPI = new UserAPI();
	CommentAPI commentAPI = new CommentAPI();
	String[] info = new String[6];
	info[0] = session.getAttribute("loginUserID").toString();
	String targetUserName = request.getParameter("targetUserName").toString();
	info[1] = userAPI.getUserIDByName(targetUserName);
	info[2] = request.getParameter("statusID");
	Date date = new Date();
	info[3] = new SimpleDateFormat("yyyy-MM-dd").format(date);
	info[4] = new SimpleDateFormat("HH:mm:ss").format(date);
	info[5] = request.getParameter("content").toString();
	
	boolean success = commentAPI.addComment(info);
	String successCode = success?"ture":"false";
	session.setAttribute("commentSuccess",successCode);
%>