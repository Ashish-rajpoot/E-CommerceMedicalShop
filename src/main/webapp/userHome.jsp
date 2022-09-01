
<%@page import="com.mycart.entity.User"%>
<%@page import="com.sessionfactory.Factory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user = (User) session.getAttribute("userObj");
if (user == null) {
	session.setAttribute("errorMsg", "Please Login !!!");
	response.sendRedirect("login.jsp");
	return;
} else if (user.getUserType().equals("user")) {
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="styleSheet" href="css/style.css"> -->
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%@ include file="component/common_modal.jsp"%>
	<br><br>
<%@include file="index.jsp" %>
	<%
	}
	%>
</body>
</html>