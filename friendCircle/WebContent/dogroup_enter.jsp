<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="friendCircle.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	GroupAPI groupApi=new GroupAPI();
	String userName=session.getAttribute("loginUser").toString();
	String groupId=session.getAttribute("groupFound").toString();
	groupApi.enterGroup(userName,groupId);
	response.sendRedirect("user-group.jsp");
%>