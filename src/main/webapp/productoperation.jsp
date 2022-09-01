
<%@page import="com.mycart.entity.User"%>
<%@page import="com.mycart.dao.UserDao"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.sessionfactory.Helper"%>
<%@page import="com.mycart.entity.Product"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.entity.Category"%>
<%@page import="com.mycart.dao.CategoryDAo"%>
<%@page import="com.sessionfactory.Factory"%>
<%@page import="java.util.List"%>

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
	<br>
	<br>
	<%
	User user = (User) session.getAttribute("adminObj");

	if (user == null) {
		session.setAttribute("errorMsg", "Please Login !!!");
		response.sendRedirect("login.jsp");
		return;
	}

	%>

	<div class="container-fluid">
		<%@include file="component/massage.jsp"%>
		<div class="row mt-4 mx-4 ">
			<div class="col-md-2">
				<div class="list-group">
					<a class="list-group-item list-group-item-action active ctname-bg"
						aria-current="true"> Action </a> <a
						href="productoperation.jsp?category=category"
						class="list-group-item list-group-item-action  ctname-bg ">Category</a>
					<a href="productoperation.jsp?category=product"
						class="list-group-item list-group-item-action  ctname-bg ">Products</a>
					<a href="productoperation.jsp?category=user"
						class="list-group-item list-group-item-action  ctname-bg ">Users</a>

				</div>
			</div>
			<div class="col-md-10">

				

	<div class="container">
	<% if((request.getParameter("category")).equals("category")){
		CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
		List<Category> clist = categoryDAo.getAllCategory();
		%>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Category Name</th>
					<th scope="col">Category Description</th>
					<th colspan="2">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				for (Category c : clist) {

				%>
				<tr>
					
					<td><%=c.getCategoryTitle()%></td>
					<td><%=Helper.get10Words(c.getCategoryDescription())%></td>
					
					
					<td>
						<a href="update.jsp?categoryid=<%=c.getCategoryId() %>" class="btn btn-outline-warning" type="submit"
 >
							Edit</a>
							<a href="CategoryOperationServlet?deletecategoryid=<%=c.getCategoryId() %>" class="btn btn-outline-danger" type="submit"
 >
							Delete</a>
					</td>

				</tr>
				<%
				}
				%>
			</tbody>
			<%	}%>
			
			
			<% if((request.getParameter("category")).equals("product")){
				ProductDao productDao = new ProductDao(Factory.getFactory());
				List<Product> plist = productDao.getAllProduct();
		%>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Product Price</th>
					<th scope="col">Product Quantity</th>
					<th scope="col">Product Category</th>
					<th scope="col">Product Discount</th>
					<th scope="col-span">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				for (Product c : plist) {
				%>
				<tr>
					<td><%=Helper.get10Words(c.getpName())%></td>
					<td><%=c.getpPrice()%></td>
					<td><%=c.getpQuantity()%></td>
					<td><%=c.getCategory().getCategoryTitle()%></td>
					<td><%=c.getpDiscount()%></td>
					<td>
						<a href="update.jsp?productId=<%=c.getpId() %>" class="btn btn-outline-warning" type="submit"
 >
							Edit</a>
							<a href="ProductOperationServlet?deleteProductId=<%=c.getpId() %>" class="btn btn-outline-danger" type="submit"
 >
							Delete</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
			<%	}%>
			
				<% if((request.getParameter("category")).equals("user")){
				UserDao userDao = new UserDao(Factory.getFactory());
				List<User> userlist = userDao.getAllUser();
		%>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">User Name</th>
					<th scope="col">User Email</th>
					<th scope="col">User Contact</th>
					<th scope="col">User Type</th>
					<th scope="col-span">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				for (User c : userlist) {
				%>
				<tr>

					<td><%=c.getUserName()%></td>
					<td><%=c.getUserEmail()%></td>
					<td><%=c.getUserPhone()%></td>
					<td><%=c.getUserType()%></td>
					<td>
					<%if (c.getUserType().equals("admin")){%>
							<a href="update.jsp?userId=<%=c.getUserId() %>" class="btn btn-outline-warning" type="submit">
							Profile</a>
							<a data-toggle="modal" data-target="#editAdminButton" class="btn btn-outline-danger">
							Delete Admin</a>
					<% }else{%>
					
						<a href="update.jsp?userId=<%=c.getUserId() %>" class="btn btn-outline-warning" type="submit"
 >
							Profile</a>
							<a href="CategoryOperationServlet?deletecategoryid=<%=c.getUserId() %>" class="btn btn-outline-danger" type="submit"
 >
							Delete User</a>
					</td>
	<%}%>
				</tr>
				<%
				}
				%>
			</tbody>
			<%	}%>
			
			</div>
	
	

			
			
			
			
			
			
			
			
			
			
			<%@ include file="component/common_modal.jsp"%>
</body>
</html>