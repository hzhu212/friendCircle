<%@ page language="java" import="friendCircle.*,util.Util"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");//防止中文乱码
	String userName = request.getParameter("username");
	String passWord0 = Util.getMD5(request.getParameter("password0"));
	String passWord1 = Util.getMD5(request.getParameter("password1"));
	String email=request.getParameter("email");
	String[] userInfo;
	//密码输入错误or用户名被占用
	if (!passWord0.equals(passWord1) || !UserAPI.judgeName(userName)) {
		response.sendRedirect("signup_failure.jsp");
	}
	else{
		userInfo=new String[]{
			userName,passWord0,email,"","","男","1900-01-01",""
		};
		UserAPI.addUser(userInfo);
		response.sendRedirect("login.jsp");
	}
%>