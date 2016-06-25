<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="friendCircle.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>

<%
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");
	StatusAPI statusAPI = new StatusAPI();
	String[] info = new String[4];
	info[0] = session.getAttribute("loginUser");
	Date date = new Date();
	info[1] = new SimpleDateFormat("yyyy-MM-dd").format(date);
	info[2] = new SimpleDateFormat("HH:mm:ss").format(date);
	info[3] = content;
	statusAPI.addStatus(info);
%>