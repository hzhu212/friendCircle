<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="friendCircle.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");//防止中文乱码
	String groupId=request.getParameter("input");
	GroupAPI groupApi=new GroupAPI();
	if(groupApi.existGroup(groupId)){
		response.sendRedirect("group_found.jsp");
		session.setAttribute("groupFound", groupId);
	}
	else{
		response.sendRedirect("group_notfound.jsp");
	}
%>