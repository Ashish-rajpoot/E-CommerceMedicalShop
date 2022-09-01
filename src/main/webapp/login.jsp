<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

<br><br>

	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body px-5 mt-2">
						<%@include file ="component/massage.jsp" %>
						<div class="container text-center ">
							<img src="img/login.png" width="150px">
						</div>
						<h1 class=" text-center">
							<i class="fas fa-sign-in-alt"></i> Login Here
						</h1>
						
						<form action="LoginServlet" method="post" autocomplete="off" >
							 <div class="form-group">
								<label class="form-label" for="type">Choose a Role:</label> <select
									name="type" id="role" class="form-select"
									aria-label="Default select example">
									<option value="admin">Admin</option>
									<option value="user">User</option>
								</select>
							</div> 
							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									name="email" class="form-control" id="email"
									placeholder="email" required="required">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									name="password" class="form-control" id="password"
									placeholder="password" required="required">
							</div>
						<div class="form-group">
							Don't Have a Account? <a href="register.jsp"> Register</a>
						</div>
							<div class="row">
								<div class="form-group">
									<button class="btn btn-outline-success" type="submit">
										Login</button>
									<button class="btn btn-outline-warning" type="reset">
										Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>