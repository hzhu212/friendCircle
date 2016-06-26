<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="friendCircle.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("utf-8");//防止中文乱码

	UserAPI userAPI = new UserAPI();
	String[] info = new String[6];
	info[0] = session.getAttribute("loginUserID");
	String targetUserName = request.getAttribute("targetUserName");
	info[1] = userAPI.getUserIDByName(targetUserName);
	info[2] = request.getParameter("statusID");
	Date date = new Date();
	info[3] = new SimpleDateFormat("yyyy-MM-dd").format(date);
	info[4] = new SimpleDateFormat("HH:mm:ss").format(date);
	info[5] = request.getAttribute("content");

	if(dologin.judgeLegal(userName,passWord)){
		session.setAttribute("loginUser", userName);
		session.setAttribute("loginUserID", dologin.getUserIDByName(userName));
		response.sendRedirect("user-home.jsp");
	    //request.getRequestDispatcher("user-home.jsp").forward(request, response);
	}
	else{
		response.sendRedirect("login_failure.jsp");
	}
%>