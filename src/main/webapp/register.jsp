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
<br><br><br>

	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-3 ">
						<%@include file="component/massage.jsp"%>
						<div class="container text-center ">
							<img src="img/register.png" width="100px">
						</div>
						<h3 class=" text-center">
							<i class="fas fa-sign-in-alt"></i> Register Here
						</h3>
						<form action="RegisterServlet" autocomplete="off" method="post">
							<div class="form-group">
								<label class="form-label" for="type">Choose a Role:</label> <select
									name="type" id="role" class="form-select"
									aria-label="Default select example">
									<!-- <option value="admin">Admin</option> -->
									<option value="user">User</option>
								</select>
							</div>
							<div class="form-group">
								<label for="username">User Name</label> <input type="text"
									name="username" class="form-control" id="username"
									placeholder="username" required="required">
							</div>
							<div class="form-group">
								<label for="email">User Email</label> <input type="email"
									name="email" class="form-control" id="email"
									placeholder="email" required="required">
							</div>
							<div class="form-group">
								<label for="password">User Password</label> <input
									type="password" name="password" class="form-control"
									id="password" placeholder="password" required="required">
							</div>
							<div class="form-group">
								<label for="phone">User Phone</label> <input type="number"
									name="phone" class="form-control" id="phone"
									placeholder="phone" required="required">
							</div>
							<div class="form-group">
								<label for="address">User Address</label>
								<textarea name="address" style="height: 100px"
									class="form-control" id="username"
									placeholder="Enter your Address" required="required">
				</textarea>
							</div>
							<div class="form-group">
								Already Have a Account? <a href="login.jsp"> Login</a>
							</div>
							<div class="row">
								<div class="form-group">
									<button class="btn btn-outline-success" type="submit">
										Register</button>
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