<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My first jsp page</title>
</head>

<body>
	<h1 style="color: salmon;">欢迎访问我的个人主页</h1>
	<h2>hhh哈哈哈</h2>
	<!-- html注释在客户端可见 -->
	<%-- jsp注释在客户端不可见 --%>
	<%!//这里声明变量和函数，注意标签中加入了"！"
	String name = "Tomcat";
	int x = 5;
	int y = 10;

	int add(int x, int y) {
		return x + y;
	}%>
	<%
		//这是jsp脚本，在这里可以书写任意的java代码
		out.println("hello, world!");
		out.println(" your ip address is: " + request.getRemoteAddr());
	%>
	<p style="border: red dotted 2px">
		current time is:
		<%=new java.util.Date().toLocaleString()%></p>
	<!-- 使用变量用< %= % > -->
	<p>
		hello,
		<%=name%></p>
	<p>
		x = 5, y = 10, x + y =
		<%=add(x, y)%></p>

</body>
</html>