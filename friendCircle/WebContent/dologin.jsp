<%@ page language="java" import="friendCircle.*,util.Util" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");//防止中文乱码
	String userName=request.getParameter("username");
	String passWord=Util.getMD5(request.getParameter("password"));
	UserAPI dologin=new UserAPI();
	if(dologin.judgeLegal(userName,passWord)){
		session.setAttribute("loginUser", userName);
	    request.getRequestDispatcher("user-info.jsp").forward(request, response);
	}
	else{
		response.sendRedirect("login_failure.jsp");
	}
%>