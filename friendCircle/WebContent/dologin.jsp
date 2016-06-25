<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="friendCircle.*" %>
<%@ page import="util.Util" %>

<%
	request.setCharacterEncoding("utf-8");//防止中文乱码
	String userName=request.getParameter("username");
	String passWord=Util.getMD5(request.getParameter("password"));
	UserAPI dologin=new UserAPI();
	if(dologin.judgeLegal(userName,passWord)){
		session.setAttribute("loginUser", userName);
		session.setAttribute("loginUserID", dologin.getUserIDByName(userName));
	    request.getRequestDispatcher("user-home.jsp").forward(request, response);
	}
	else{
		response.sendRedirect("login_failure.jsp");
	}
%>