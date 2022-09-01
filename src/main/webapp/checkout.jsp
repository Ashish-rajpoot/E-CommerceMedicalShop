<%@page import="com.mycart.entity.User"%>
<%
		User user = (User) session.getAttribute("userObj");
	if(user==null){
		session.setAttribute("errorMsg", "Dear User, Please Login to Checkout !!!");
		response.sendRedirect("login.jsp");
		return;
	}
	%>
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
	<h1>hello</h1>
	<%@ include file="component/common_modal.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 mt-5">
				<div class="card">
					<h3 class="text-center mt-2">Items in the Cart</h3>
					<div class="card-body cart-body"></div>
				</div>

			</div>
			<div class="col-md-6 mt-5">
				<div class="card">
					<h3 class="text-center mt-2">Enter Your Details</h3>
					<div class="card-body">
						<form>
							<div class="form-group">
								<label for="exampleInputEmail1">Your Email address</label> <input
									type="email" class="form-control" name="email" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Your Name</label> <input
									type="text" name="name" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
							<div class="form-group">
								<label for="CategoryDescription">Enter Shipping Address</label>
								<textarea name="shippingaddress" style="height: 100px"
									class="form-control" id="shippingaddress"
									placeholder="Enter Shipping Address" required="required">
                            </textarea>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success">Order Now</button>
								<button type="submit" class="btn btn-outline-primary">Continue Shopping</button>
							</div>
						</form>
					</div>
				</div>

			</div>


		</div>

	</div>
</body>
</html>