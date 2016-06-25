<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	session.removeAttribute("loginUser");
	session.removeAttribute("loginUserID");
	session.invalidate();
	response.sendRedirect("home.jsp");
 %>