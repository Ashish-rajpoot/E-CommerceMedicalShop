<%@page import="com.sessionfactory.Factory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<h1>Welcome to my Cart index</h1>
	<%=Factory.getFactory()%>
	
	
	<form action="Demo" post="get">
	<div>
	<button type ="submit">submit</button>
	</div>
	</form>
</body>
</html>