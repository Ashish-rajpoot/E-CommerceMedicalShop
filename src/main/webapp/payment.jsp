<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
		<%@ include file="component/common_modal.jsp"%>
	<div class="container my-3">
		<div class="row">
			<div class="col-md-6 mt-5">
		 	<form action="Payment" method="post">
				<h3>Donation</h3>
				<input id="payment_field" type="text" class="form-control my-2"
					placeholder="Enter you Amount">
				<button  class="btn btn-success btn-block">Checkout</button>
				 </form>
			</div>
		</div>
	</div>
</body>
</html>