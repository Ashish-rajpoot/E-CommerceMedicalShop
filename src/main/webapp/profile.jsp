
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
	<c:if test="${empty userObj and empty adminObj }">
	
	<% 
		session.setAttribute("errorMsg", "Please Login !!!");
		response.sendRedirect("login.jsp");

	%>

	</c:if>
	
	
	<c:if test="${not empty adminObj }">
	<%
	User user = (User) session.getAttribute("adminObj");
			
			UserDao userDao = new UserDao(Factory.getFactory());
			User oneUser = userDao.getUserById(user.getUserId());
			
	%>
	
<div class="container admin">
		<div class="row mt-5 ">
			<div>
				<%@include file="component/massage.jsp"%>
			</div>
			<div class="col-md-6 offset-3 mt-3">
				<div class="card shadow-lg p-3 mb-5  rounded">
					<div class="card-body ">
						<div class="container text-center ">
							<img style="max-width: 125px;" src="img/add-user.png" alt="na">
						</div>
					<form action="ProductOperationServlet" autocomplete="off"
				method="post">
				<input type="hidden" name="operation" value="updateAdminProfile">
								<div class="form-group">
					<label for="username"></label> <input type="hidden"
						name="uId" value="<%=oneUser.getUserId() %>"
						class="form-control" id="username" placeholder="username"
						required="required" readonly="readonly" >
				</div>
				<div class="form-group">
					<label class="form-label" for="type">Role:</label> <select
						name="type" id="role" class="form-select"
						aria-label="Default select example">
						<!-- <option value="admin">Admin</option> -->
						<option value="<%=oneUser.getUserType()%>"><%=oneUser.getUserType() %></option>
					</select>
				</div>
				<div class="form-group">
					<label for="username">User Name</label> <input type="text"
						name="username" value="<%=oneUser.getUserName() %>"
						class="form-control" id="username" placeholder="username"
						required="required">
				</div>
				<div class="form-group">
					<label for="email">Admin Email</label> <input type="email"
						name="email" value="<%=oneUser.getUserEmail() %>"
						class="form-control" id="email" placeholder="email"
						required="required">
				</div>
				<div class="form-group">
					<label for="password">Admin Password</label> <input type="password"
						name="password" value="<%=oneUser.getUserPass() %>"
						class="form-control" id="password" placeholder="password"
						required="required">
				</div>
				<div class="form-group">
					<label for="phone">Admin Phone</label> <input type="number"
						name="phone" value="<%=oneUser.getUserPhone() %>"
						class="form-control" id="phone" placeholder="phone"
						required="required">
				</div>
				<div class="form-group">
					<label for="address">Admin Address</label>
					<input type="text" name="address" value="<%=oneUser.getUserAddress()%>"
						style="height: 100px" class="form-control" id="username"
						placeholder="Enter your Address" required="required">
				</div>
				<div class="row mt-4">
					<div class="form-group">
						<button class="btn btn-outline-success" type="submit">
							Update</button>
					</div>
				</div>
			</form>
					</div>
				</div>
				</a>
			</div>

	</div>


	</c:if>	


<c:if test="${not empty userObj }">

	<div> User</div>
	
	<%
	User user = (User) session.getAttribute("userObj");
			
			UserDao userDao = new UserDao(Factory.getFactory());
			User oneUser = userDao.getUserById(user.getUserId());
			
	%>
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<%@include file ="component/massage.jsp" %>
			<form action="ProductOperationServlet" autocomplete="off"
				method="post">
				<input type="hidden" name="operation" value="updateUserProfile">
								<div class="form-group">
					<label for="username">User Id</label> <input type="hidden"
						name="uId" value="<%=oneUser.getUserId() %>"
						class="form-control" id="username" placeholder="username"
						required="required" readonly="readonly" >
				</div>
				<div class="form-group">
					<label class="form-label" for="type">Choose a Role:</label> <select
						name="type" id="role" class="form-select"
						aria-label="Default select example">
						<!-- <option value="admin">Admin</option> -->
						<option value="<%=oneUser.getUserType()%>"><%=oneUser.getUserType() %></option>
					</select>
				</div>
				<div class="form-group">
					<label for="username">User Name</label> <input type="text"
						name="username" value="<%=oneUser.getUserName() %>"
						class="form-control" id="username" placeholder="username"
						required="required">
				</div>
				<div class="form-group">
					<label for="email">User Email</label> <input type="email"
						name="email" value="<%=oneUser.getUserEmail() %>"
						class="form-control" id="email" placeholder="email"
						required="required">
				</div>
				<div class="form-group">
					<label for="password">User Password</label> <input type="password"
						name="password" value="<%=oneUser.getUserPass() %>"
						class="form-control" id="password" placeholder="password"
						required="required">
				</div>
				<div class="form-group">
					<label for="phone">User Phone</label> <input type="number"
						name="phone" value="<%=oneUser.getUserPhone() %>"
						class="form-control" id="phone" placeholder="phone"
						required="required">
				</div>
				<div class="form-group">
					<label for="address">User Address</label>
					<input type="text" name="address" value="<%=oneUser.getUserAddress()%>"
						style="height: 100px" class="form-control" id="username"
						placeholder="Enter your Address" required="required">
				</div>
				<div class="row mt-4">
					<div class="form-group">
						<button class="btn btn-outline-success" type="submit">
							Update</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</c:if>
	
	
			<%@ include file="component/common_modal.jsp"%>
</body>
</html>